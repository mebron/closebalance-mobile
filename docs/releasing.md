# White-Label APK Release Guide

How to build and release a new client flavor APK.

---

## Prerequisites

- Flutter and Dart on PATH
- Android SDK configured
- Access to `https://closebalance.com` admin panel (landlord login)

---

## Step 1 — Set up the client on the server

Log into the CloseBalance admin at `https://closebalance.com/admin`.

### Create the company

Go to **Companies → New** and fill in:
- **Name** — e.g. `Juicy Balance`
- **Slug** — e.g. `juicy` (used as the API identifier — lowercase, no spaces)
- **Plan** — select appropriate plan
- **Status** — Active

### Configure App Branding

In the **App Branding** section on the company form:
- **Package Name** — e.g. `com.closebalance.juicy`
- **Primary Color** — main brand color (hex)
- **Accent Color** — highlight/action color (hex)
- **Splash Background** — splash screen background color (hex)
- **In-App Logo** — PNG shown in the app header/login (optional)
- **App Icon (512×512)** — PNG used as the Android/iOS launcher icon

Save the company. The branding is now available at:
```
GET https://closebalance.com/api/v1/branding/<slug>
```

---

## Step 2 — Add the flavor to the mobile codebase

### 2a. Add the flavor enum

In `lib/core/config/flavor_config.dart`, add the new flavor to the `Flavor` enum:

```dart
enum Flavor { closebalance, juicy, cupcake, yournewflavor }
```

### 2b. Create the entrypoint

Create `lib/main_yournewflavor.dart`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.yournewflavor,
    primaryColor: Color(0xFF000000), // placeholder — overwritten by build script
    accentColor: Color(0xFF000000),
    bgColor: Color(0xFF000000),
    appName: 'Your App Name',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
```

> Colors are placeholders. The build script (`tool/build_flavor.dart`) overwrites them
> from the server before compiling.

### 2c. Add the Android product flavor

In `android/app/build.gradle.kts`, inside the `productFlavors` block:

```kotlin
create("yournewflavor") {
    dimension = "brand"
    applicationId = "com.closebalance.yournewflavor"
    resValue("string", "app_name", "Your App Name")
}
```

### 2d. Create Android resource directories

```
android/app/src/yournewflavor/res/
```

Flutter/Gradle will create the icon and splash files here during the build.

### 2e. Create iOS xcconfig files

`ios/Flutter/Debug-yournewflavor.xcconfig`:
```
#include "Debug.xcconfig"
PRODUCT_BUNDLE_IDENTIFIER=com.closebalance.yournewflavor
DISPLAY_NAME=Your App Name
FLUTTER_TARGET=lib/main_yournewflavor.dart
```

`ios/Flutter/Release-yournewflavor.xcconfig`:
```
#include "Release.xcconfig"
PRODUCT_BUNDLE_IDENTIFIER=com.closebalance.yournewflavor
DISPLAY_NAME=Your App Name
FLUTTER_TARGET=lib/main_yournewflavor.dart
```

### 2f. Add a placeholder icon asset

```
assets/icon/yournewflavor/app_icon.png
```

Copy any PNG as a placeholder — the build script replaces it from the server.

Declare the asset directory in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/icon/yournewflavor/
```

### 2g. Register the flavor in the build script

In `tool/build_flavor.dart`, add to `flavorSlugs`:

```dart
const Map<String, String> flavorSlugs = {
  'closebalance': 'closebalance',
  'juicy': 'juicy',
  'cupcake': 'cupcake',
  'yournewflavor': 'yournewflavor', // add this
};
```

---

## Step 3 — Build the APK

From the `mobile/` directory:

```bash
dart tool/build_flavor.dart yournewflavor
```

What the script does automatically:
1. Fetches branding JSON from `https://closebalance.com/api/v1/branding/<slug>`
2. Downloads the app icon and writes it to `assets/icon/<flavor>/app_icon.png`
3. Patches `flutter_launcher_icons-<flavor>.yaml` with the adaptive icon background color
4. Patches `flutter_native_splash-<flavor>.yaml` with the splash background color
5. Patches `lib/main_<flavor>.dart` with the primary / accent / bg colors
6. Runs `dart run flutter_launcher_icons -f flutter_launcher_icons-<flavor>.yaml`
7. Runs `dart run flutter_native_splash:create --flavor=<flavor>`
8. Builds the release APK

Output: `build/app/outputs/flutter-apk/app-<flavor>-release.apk`

> If the YAML files don't exist yet, the script skips patching them (they are created
> on the first run of flutter_launcher_icons / flutter_native_splash manually or by
> copying from another flavor as a template).

---

## Launcher icon and splash YAML templates

If the YAML files don't exist, create them before running the build script.

**`flutter_launcher_icons-yournewflavor.yaml`** (copy from juicy, update flavor name):
```yaml
flutter_launcher_icons:
  android: "ic_launcher"
  ios: true
  image_path: "assets/icon/yournewflavor/app_icon.png"
  min_sdk_android: 21
  remove_alpha_ios: true
  adaptive_icon_background: "#000000"   # overwritten by build script
  adaptive_icon_foreground: "assets/icon/yournewflavor/app_icon.png"
  flavors:
    - yournewflavor
```

**`flutter_native_splash-yournewflavor.yaml`**:
```yaml
flutter_native_splash:
  color: "#000000"   # overwritten by build script
  image: assets/icon/yournewflavor/app_icon.png
  android: true
  ios: true
  web: false
```

---

## Troubleshooting

| Issue | Fix |
|---|---|
| `Unknown flavor` error from build script | Add flavor to `flavorSlugs` in `tool/build_flavor.dart` |
| `Could not reach branding API` | Check the slug matches the company slug on the server |
| Icon not updated | Ensure the App Icon (512×512) is uploaded and saved on the admin panel |
| Colors wrong in app | Ensure Primary/Accent/Splash colors are saved in App Branding on the server |
| Gradle build fails | Run `flutter clean` first, then re-run the build script |
| `assets/icon/<flavor>/` not found | Add the directory to `flutter.assets` in `pubspec.yaml` |
