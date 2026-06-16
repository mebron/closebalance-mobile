import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../../features/auth/auth_controller.dart';

/// Displays the company logo: URL-based when branding is set, asset fallback otherwise.
class CompanyLogo extends ConsumerWidget {
  const CompanyLogo({super.key, this.height = 48, this.color});

  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logoUrl =
        ref.watch(authControllerProvider).value?.company.branding.logoUrl;

    if (logoUrl != null && logoUrl.isNotEmpty) {
      return Image.network(
        logoUrl,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (_, _, _) => _assetLogo(),
      );
    }

    return _assetLogo();
  }

  Widget _assetLogo() => Image.asset(
        'assets/images/logo-mobile-light.png',
        height: height,
        fit: BoxFit.contain,
        color: color ?? AppColors.card,
      );
}
