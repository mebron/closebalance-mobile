import 'package:flutter/material.dart';

enum Flavor { closebalance, almadina, juicy }

class FlavorConfig {
  const FlavorConfig({
    required this.flavor,
    required this.primaryColor,
    required this.bgColor,
    required this.appName,
  });

  final Flavor flavor;
  final Color primaryColor;
  final Color bgColor;
  final String appName;

  String get iconAsset => 'assets/icon/${flavor.name}/app_icon.png';

  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;
  static void setInstance(FlavorConfig config) => _instance = config;
}
