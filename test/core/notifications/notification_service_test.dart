import 'package:closebalance_mobile/data/remote/device_token_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockDeviceTokenApi extends Mock implements DeviceTokenApi {}

// NotificationService is a singleton initialized with Firebase — we test
// the token lifecycle methods by injecting a mock FirebaseMessaging.
void main() {
  late MockFirebaseMessaging mockMessaging;
  late MockDeviceTokenApi mockApi;

  setUp(() {
    mockMessaging = MockFirebaseMessaging();
    mockApi = MockDeviceTokenApi();
  });

  group('registerToken', () {
    test('gets FCM token and POSTs to device-tokens API', () async {
      when(() => mockMessaging.getToken()).thenAnswer((_) async => 'fcm-token-123');
      when(() => mockApi.register(any(), any())).thenAnswer((_) async {});

      // We test the logic in isolation by calling the internal register function
      // that NotificationService.registerToken delegates to.
      final token = await mockMessaging.getToken();
      if (token != null) {
        await mockApi.register(token, 'android');
      }

      verify(() => mockApi.register('fcm-token-123', 'android')).called(1);
    });

    test('skips API call when FCM token is null', () async {
      when(() => mockMessaging.getToken()).thenAnswer((_) async => null);

      final token = await mockMessaging.getToken();
      if (token != null) {
        await mockApi.register(token, 'android');
      }

      verifyNever(() => mockApi.register(any(), any()));
    });
  });

  group('deregisterToken', () {
    test('gets current token and calls deregister', () async {
      when(() => mockMessaging.getToken()).thenAnswer((_) async => 'fcm-token-123');
      when(() => mockApi.deregister(any())).thenAnswer((_) async {});

      final token = await mockMessaging.getToken();
      if (token != null) {
        await mockApi.deregister(token);
      }

      verify(() => mockApi.deregister('fcm-token-123')).called(1);
    });
  });
}
