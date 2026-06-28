# Push Notifications — Design Spec

**Date:** 2026-06-28
**Scope:** Laravel backend + Flutter mobile (cupcake flavor first, then all flavors)

---

## Overview

Three notification types delivered via two mechanisms:

| Notification | Trigger | Delivery | Recipients |
|---|---|---|---|
| Closing finalized | A closing is finalized | FCM (remote) | All users on that branch |
| Daily reminder | 9 PM scheduler, if no closing today | FCM (remote) | All users on branchless-closing branches |
| Sync failure | Offline sync replay fails | Local (on-device) | The affected user only |

**FCM library:** `laravel-notification-channels/fcm` (HTTP v1 API via Service Account JSON).  
**Per-flavor Firebase:** each flavor has its own Firebase project; credentials stored on the Company record.

---

## Backend

### 1. Database — `device_tokens` table

```
id               bigint PK
user_id          bigint FK → users
token            string unique
platform         enum(android, ios)
created_at       timestamp
updated_at       timestamp
```

- Tenant-scoped via `BelongsToTenant`.
- Upsert on `token` — rotating tokens don't accumulate stale rows.
- On logout: delete by token value.

### 2. API Endpoints

Both under existing `auth:sanctum` + `SetTenantFromUser` middleware.

```
POST   /api/v1/device-tokens          Register or refresh a token
DELETE /api/v1/device-tokens/{token}  Deregister by token value on logout
```

`POST` body: `{ token: string, platform: android|ios }`  
`POST` is an upsert — safe to call on every login and on token refresh.

### 3. Company Firebase Settings

Two new fields on Company branding/settings:

- `fcm_service_account` — JSON string of the Firebase Service Account (used server-side to send via FCM HTTP v1 API)
- `fcm_google_services` — the `google-services.json` content (served to the build script at `GET /api/v1/branding/{slug}/fcm-config`)

Both fields are nullable. If absent, FCM sending is silently skipped.

### 4. Notifications

#### `ClosingFinalizedNotification`
- **Trigger:** `DailyClosing` model fires a `ClosingFinalized` event inside its `finalize()` method. A listener `SendClosingFinalizedNotification` handles it.
- **Recipients:** All `User` records with `branch_id = $closing->branch_id` who have at least one `DeviceToken`.
- **Payload:**
  ```json
  { "type": "closing_finalized", "closing_id": 123, "branch": "Main Branch", "date": "2026-06-28" }
  ```
- **Title/body:** `"[Branch] Closing Submitted"` / `"[Name] submitted the closing for [date]."`

#### `DailyClosingReminderNotification`
- **Trigger:** Laravel scheduler at 9 PM (`->dailyAt('21:00')`).
- **Command:** `app:send-closing-reminders` — queries all branches that have no **finalized** `DailyClosing` for today (branches with a draft still get the reminder — they haven't submitted yet), collects their users' device tokens, and sends the notification.
- **Recipients:** All users belonging to reminder-eligible branches.
- **Payload:**
  ```json
  { "type": "daily_reminder" }
  ```
- **Title/body:** `"Daily Closing Reminder"` / `"Don't forget to submit today's closing."`

### 5. Package & Config

```
composer require laravel-notification-channels/fcm
```

Firebase credentials loaded per-tenant: when sending, the notification channel is instantiated with the current tenant's `fcm_service_account` JSON from Company settings. If no credentials are configured, sending is skipped gracefully.

---

## Flutter Mobile

### 1. New Packages

```yaml
# pubspec.yaml additions
firebase_core: ^3.0.0
firebase_messaging: ^15.0.0
flutter_local_notifications: ^18.0.0
```

### 2. Firebase Config per Flavor

`google-services.json` lives at:
```
android/app/src/cupcake/google-services.json
android/app/src/juicy/google-services.json    # future
android/app/src/closebalance/google-services.json  # future
```

The build script (`tool/build_flavor.dart`) gains a new step — after fetching branding, it calls `GET /api/v1/branding/{slug}/fcm-config` and writes the response to `android/app/src/{flavor}/google-services.json`. If the endpoint returns 404 (not configured), the step is skipped (FCM will not work for that build, but the build succeeds).

`android/app/build.gradle.kts` gets the Google Services plugin added:
```kotlin
plugins {
    id("com.google.gms.google-services")
}
```

### 3. `NotificationService`

**Location:** `lib/core/notifications/notification_service.dart`

Responsibilities:
1. `initialize()` — called from `main_{flavor}.dart` before `runApp`. Initializes `Firebase`, `flutter_local_notifications`, and sets up message handlers.
2. `requestPermission()` — called once after login. Requests FCM permission (iOS requires explicit grant; Android 13+ does too).
3. `registerToken(DeviceTokenApi api)` — gets the FCM token, POSTs to `/api/v1/device-tokens`. Sets up `onTokenRefresh` listener to re-register automatically.
4. `deregisterToken(DeviceTokenApi api)` — DELETEs the current token on logout.
5. `showLocalNotification(String title, String body)` — displays an immediate local notification via `flutter_local_notifications`. Used for sync failures.
6. `_handleMessage(RemoteMessage)` — routes tap payloads to the correct screen via the app's `GoRouter`.

**Message handlers registered:**
- `FirebaseMessaging.onMessage` — foreground: show local notification via `flutter_local_notifications`
- `FirebaseMessaging.onMessageOpenedApp` — background tap: call `_handleMessage`
- `FirebaseMessaging.getInitialMessage()` — terminated tap: call `_handleMessage` after app boots

### 4. Token Lifecycle

```
Login  → AuthController.login() → NotificationService.requestPermission()
                                 → NotificationService.registerToken()

Logout → AuthController.logout() → NotificationService.deregisterToken()
                                  → (then clears Sanctum token as before)

Token rotation → FirebaseMessaging.onTokenRefresh → NotificationService.registerToken()
```

### 5. Notification Tap Navigation

| `type` payload value | Navigate to |
|---|---|
| `closing_finalized` | `/closing` (today's closing form) |
| `daily_reminder` | `/closing` |
| *(local — sync failure)* | `/closings` (history list) |

### 6. Sync Failure Local Notification

`SyncCoordinator` (existing) catches `AppException` during replay. On failure it calls:
```dart
NotificationService.instance.showLocalNotification(
  'Sync Failed',
  'Some offline changes could not be synced. Tap to review.',
);
```

No server round-trip required.

---

## New API Layer — `DeviceTokenApi`

**Location:** `lib/data/remote/device_token_api.dart`

```dart
class DeviceTokenApi {
  Future<void> register(String token, String platform);
  Future<void> deregister(String token);
}
```

Injected into `NotificationService` via Riverpod provider.

---

## Manual Setup (One-Time per Flavor)

1. Create Firebase project at console.firebase.google.com
2. Add Android app — package name `com.closebalance.cupcake`
3. Download `google-services.json` → upload to cupcake Company admin settings
4. Generate Service Account JSON (Project Settings → Service Accounts → Generate new private key) → paste into cupcake Company admin settings as `fcm_service_account`
5. From that point on, `dart tool/build_flavor.dart cupcake` handles the rest automatically

---

## Testing

### Laravel
- Feature test: `POST /api/v1/device-tokens` upserts correctly; `DELETE` removes by token
- Unit test: `ClosingFinalizedNotification` — assert correct recipients (same branch only) and payload structure
- Unit test: `app:send-closing-reminders` — assert skips branches with a closing, notifies branches without one
- Existing finalize test: assert `ClosingFinalized` event is dispatched

### Flutter
- Unit test: `NotificationService.registerToken` — mock `FirebaseMessaging` + `DeviceTokenApi`, assert POST is called with correct platform
- Unit test: `NotificationService.deregisterToken` — assert DELETE is called on logout
- Existing sync tests: assert `showLocalNotification` is called when replay throws
