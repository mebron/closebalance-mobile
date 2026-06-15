import 'package:closebalance_mobile/core/providers.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/repos/closing_repository.dart';
import 'package:closebalance_mobile/features/closings/closings_list_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockClosingRepo extends Mock implements ClosingRepository {}

void main() {
  test('loads first page for the selected branch', () async {
    final repo = _MockClosingRepo();
    when(() => repo.list(branchId: 1)).thenAnswer((_) async => Paginated(
          items: [
            DailyClosing.fromJson({
              'id': 1,
              'date': '2026-06-14',
              'status': 'draft',
              'total_sales': 100.0,
            })
          ],
          meta: PageMeta.fromJson({
            'current_page': 1,
            'last_page': 1,
            'per_page': 15,
            'total': 1,
          }),
        ));

    final c = ProviderContainer(overrides: [
      closingRepositoryProvider.overrideWithValue(repo),
      selectedBranchProvider.overrideWith((ref) => 1),
    ]);
    addTearDown(c.dispose);

    final items = await c.read(closingsListControllerProvider.future);
    expect(items.single.id, 1);
  });
}
