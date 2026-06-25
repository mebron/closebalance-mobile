import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(
    flavor: Flavor.cupcake,
    primaryColor: Color(0xFFFF9900),
    accentColor: Color(0xFF0099FF),
    bgColor: Color(0xFF0099FF),
    appName: 'CupCake',
  ));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
