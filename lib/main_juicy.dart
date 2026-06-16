import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.juicy,
    primaryColor: Color(0xFFEE2B2B),
    bgColor: Color(0xFFEE2B2B),
    appName: 'Juicy',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
