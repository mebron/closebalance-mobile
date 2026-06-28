import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';
import 'core/notifications/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.closebalance,
    primaryColor: Color(0xFF22C55E),
    accentColor: Color(0xFF22C55E),
    bgColor: Color(0xFF00182A),
    appName: 'CloseBalance',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
