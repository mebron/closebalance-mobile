import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../../features/closings/closings_list_controller.dart';
import '../../features/dashboard/dashboard_controller.dart';

/// Mounts once near the app root. Syncs dirty editable closings on startup, when
/// connectivity returns, and when the app comes to the foreground; refreshes the
/// dashboard after a successful sync so synced entries are reflected in the UI.
class SyncCoordinator extends ConsumerStatefulWidget {
  const SyncCoordinator({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<SyncCoordinator> createState() => _SyncCoordinatorState();
}

class _SyncCoordinatorState extends ConsumerState<SyncCoordinator>
    with WidgetsBindingObserver {
  StreamSubscription<bool>? _connectivitySubscription;
  bool _flushing = false;

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
    if (_flushing) {
      return;
    }
    _flushing = true;
    try {
      // Refresh reference data (channels, counters, categories) so web-panel
      // changes are picked up without requiring a logout/login.
      try {
        await ref.read(referenceRepositoryProvider).refresh();
        if (mounted) ref.invalidate(referenceDataProvider);
      } on Object {
        // offline — keep stale cache, retry next foreground/connectivity event
      }

      final store = ref.read(editableClosingStoreProvider);
      final sync = ref.read(closingSyncServiceProvider);
      final dirty = await store.dirtyClosings();
      var synced = 0;
      for (final c in dirty) {
        try {
          final fresh = await sync.sync(c);
          await store.save(fresh, dirty: false);
          synced++;
        } on Object {
          break; // network/validation — keep dirty, retry later
        }
      }
      if (synced > 0 && mounted) {
        ref.invalidate(dashboardControllerProvider);
        ref.invalidate(closingsListControllerProvider);
      }
    } finally {
      _flushing = false;
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
