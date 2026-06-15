import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/repos/closing_repository.dart';
import 'package:closebalance_mobile/features/closings/closing_detail_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockClosingRepo extends Mock implements ClosingRepository {}

DailyClosing _c(String status) => DailyClosing.fromJson(
    {'id': 9, 'date': '2026-06-14', 'status': status, 'total_sales': 100.0});

void main() {
  test('loads detail then finalize flips status', () async {
    final repo = _MockClosingRepo();
    when(() => repo.detail(9)).thenAnswer((_) async => _c('draft'));
    when(() => repo.finalize(9)).thenAnswer((_) async => _c('finalized'));

    final c = ProviderContainer(overrides: [
      closingRepositoryProvider.overrideWithValue(repo),
    ]);
    addTearDown(c.dispose);

    final detail = await c.read(closingDetailControllerProvider(9).future);
    expect(detail.statusIsFinalized, isFalse);

    await c.read(closingDetailControllerProvider(9).notifier).finalize();
    expect(c.read(closingDetailControllerProvider(9)).value!.statusIsFinalized,
        isTrue);
  });
}
