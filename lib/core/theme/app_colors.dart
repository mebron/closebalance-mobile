import 'package:flutter/material.dart';

/// CloseBalance brand palette (from the brand sheet in public/images).
abstract final class AppColors {
  static const navy = Color(0xFF00182A);
  static const navyBlend = Color(0xFF143A6B); // gradient end
  static const blue = Color(0xFF1B4D8C);
  static const green = Color(0xFF22C55E); // primary action / money-in
  static const greenLight = Color(0xFF90D981); // success
  static const slate = Color(0xFF647488); // muted text
  static const surface = Color(0xFFF2F5F9);
  static const card = Colors.white;
  static const danger = Color(0xFFE5484D);

  static const headerGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [navy, navyBlend],
  );
}
