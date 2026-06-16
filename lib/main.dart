import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';

void main() {
  FlavorConfig.setInstance(const FlavorConfig(flavor: Flavor.closebalance));
  runApp(const ProviderScope(child: CloseBalanceApp()));
}
