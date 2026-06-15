import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/router/app_router.dart';
import 'core/sync/sync_coordinator.dart';
import 'core/theme/app_theme.dart';

class CloseBalanceApp extends ConsumerWidget {
  const CloseBalanceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return SyncCoordinator(
      child: MaterialApp.router(
        title: 'CloseBalance',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routerConfig: router,
      ),
    );
  }
}
