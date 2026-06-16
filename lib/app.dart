import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/flavor_config.dart';
import 'core/router/app_router.dart';
import 'core/sync/sync_coordinator.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/auth_controller.dart';

class CloseBalanceApp extends ConsumerWidget {
  const CloseBalanceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final auth = ref.watch(authControllerProvider).value;
    final branding = auth?.company.branding;
    final primaryColor =
        AppTheme.parseHex(branding?.primaryColor) ?? FlavorConfig.instance.primaryColor;
    final accentColor =
        AppTheme.parseHex(branding?.accentColor) ?? FlavorConfig.instance.accentColor;

    return SyncCoordinator(
      child: MaterialApp.router(
        title: auth?.company.name ?? FlavorConfig.instance.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(primaryColor: primaryColor, accentColor: accentColor),
        routerConfig: router,
      ),
    );
  }
}
