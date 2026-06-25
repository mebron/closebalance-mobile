import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.cupcake,
    primaryColor: Color(0xFF00182A),
    accentColor: Color(0xFF22C55E),
    bgColor: Color(0xFF00182A),
    appName: 'CupCake',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
