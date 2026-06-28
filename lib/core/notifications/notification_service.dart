import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../data/remote/device_token_api.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class NotificationService {
  NotificationService._();

  static NotificationService? _instance;
  static NotificationService get instance => _instance!;

  final _localNotifications = FlutterLocalNotificationsPlugin();
  String? _currentToken;

  static Future<void> initialize() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    const androidChannel = AndroidNotificationChannel(
      'closebalance_default',
      'CloseBalance Notifications',
      importance: Importance.high,
    );

    final localNotifications = FlutterLocalNotificationsPlugin();
    await localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidChannel);

    await localNotifications.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    final service = NotificationService._();
    service._setupForegroundHandler(localNotifications);
    _instance = service;
  }

  void _setupForegroundHandler(FlutterLocalNotificationsPlugin localNotifications) {
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'closebalance_default',
            'CloseBalance Notifications',
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    // Navigation is handled at the app level by listening to
    // FirebaseMessaging.onMessageOpenedApp directly where GoRouter is accessible.
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission();
  }

  Future<void> registerToken(DeviceTokenApi api) async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;

    _currentToken = token;
    final platform = Platform.isIOS ? 'ios' : 'android';

    await api.register(token, platform);

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      _currentToken = newToken;
      await api.register(newToken, platform);
    });
  }

  Future<void> deregisterToken(DeviceTokenApi api) async {
    final token = _currentToken ?? await FirebaseMessaging.instance.getToken();
    if (token == null) return;

    await api.deregister(token);
    _currentToken = null;
  }

  Future<void> showLocalNotification(String title, String body) async {
    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'closebalance_default',
          'CloseBalance Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );
  }
}
