import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.juicy,
    primaryColor: Color(0xFFFF3B30),
    accentColor: Color(0xFFFFCC00),
    bgColor: Color(0xFFCF6679),
    appName: 'Juicy',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
