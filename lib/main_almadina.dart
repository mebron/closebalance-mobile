import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.almadina,
    primaryColor: Color(0xFF1B4D8C),
    bgColor: Color(0xFF1B4D8C),
    appName: 'Al Madina Cash',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
