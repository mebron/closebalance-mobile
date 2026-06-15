import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../../features/dashboard/dashboard_controller.dart';

/// Mounts once near the app root. Flushes the offline queue on startup, when
/// connectivity returns, and when the app comes to the foreground; refreshes the
/// dashboard after a successful flush so synced entries replace the optimistic overlay.
class SyncCoordinator extends ConsumerStatefulWidget {
  const SyncCoordinator({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<SyncCoordinator> createState() => _SyncCoordinatorState();
}

class _SyncCoordinatorState extends ConsumerState<SyncCoordinator>
    with WidgetsBindingObserver {
  StreamSubscription<bool>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => _flush());
    _connectivitySubscription = ref
        .read(connectivityServiceProvider)
        .onlineChanges
        .listen((online) {
      if (online) {
        _flush();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _flush();
    }
  }

  Future<void> _flush() async {
    final report = await ref.read(syncServiceProvider).flush();
    if (report.synced > 0 && mounted) {
      ref.invalidate(dashboardControllerProvider);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
