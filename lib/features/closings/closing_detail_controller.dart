import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../data/models/daily_closing.dart';

class ClosingDetailController extends AsyncNotifier<DailyClosing> {
  ClosingDetailController(this.closingId);

  final int closingId;

  @override
  Future<DailyClosing> build() =>
      ref.read(closingRepositoryProvider).detail(closingId);

  Future<void> finalize() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(closingRepositoryProvider).finalize(closingId));
    if (state.hasError) {
      throw state.error!;
    }
  }
}

final closingDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ClosingDetailController, DailyClosing, int>(
        (id) => ClosingDetailController(id));
