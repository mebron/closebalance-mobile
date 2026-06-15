import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/daily_closing.dart';

/// Loads the first page of closings for the selected branch (most recent first).
class ClosingsListController extends AsyncNotifier<List<DailyClosing>> {
  @override
  Future<List<DailyClosing>> build() async {
    final branchId = ref.watch(selectedBranchProvider);
    final page = await ref.read(closingRepositoryProvider).list(branchId: branchId);
    return page.items;
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build());
  }
}

final closingsListControllerProvider =
    AsyncNotifierProvider.autoDispose<ClosingsListController, List<DailyClosing>>(
        ClosingsListController.new);
