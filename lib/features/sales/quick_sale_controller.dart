import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';

String _todayIso() {
  final n = DateTime.now();
  return '${n.year.toString().padLeft(4, '0')}-${n.month.toString().padLeft(2, '0')}-${n.day.toString().padLeft(2, '0')}';
}

class QuickSaleController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> submit({required int paymentChannelId, required num amount}) async {
    final branchId = ref.read(selectedBranchProvider);
    if (branchId == null) {
      throw StateError('Select a branch first.');
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => ref.read(closingRepositoryProvider).addSale(
          branchId: branchId,
          today: _todayIso(),
          paymentChannelId: paymentChannelId,
          amount: amount,
        ));
    if (state.hasError) {
      throw state.error!;
    }
  }
}

final quickSaleControllerProvider =
    AsyncNotifierProvider.autoDispose<QuickSaleController, void>(QuickSaleController.new);
