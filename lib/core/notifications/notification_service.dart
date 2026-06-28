import 'package:firebase_core/firebase_core.dart';

class NotificationService {
  NotificationService._();

  static NotificationService? _instance;
  static NotificationService get instance => _instance!;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    _instance = NotificationService._();
  }
}
