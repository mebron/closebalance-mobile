import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';

String _todayIso() {
  final n = DateTime.now();
  return '${n.year.toString().padLeft(4, '0')}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
}

class QuickExpenseController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> submit({
    required int expenseCategoryId,
    required String description,
    required num amount,
    required String paymentMethod,
  }) async {
    final branchId = ref.read(selectedBranchProvider);
    if (branchId == null) {
      throw StateError('Select a branch first.');
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(closingRepositoryProvider).addExpense(
          branchId: branchId,
          today: _todayIso(),
          expenseCategoryId: expenseCategoryId,
          description: description,
          amount: amount,
          paymentMethod: paymentMethod,
        ));
    if (state.hasError) {
      throw state.error!;
    }
  }
}

final quickExpenseControllerProvider =
    AsyncNotifierProvider.autoDispose<QuickExpenseController, void>(QuickExpenseController.new);
