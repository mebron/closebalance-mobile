import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/pending_mutation.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/repos/closing_repository.dart';
import 'package:closebalance_mobile/data/sync/sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_offline_queue.dart';

class _MockApiService extends Mock implements ClosingApiService {}

class _StubSync extends SyncService {
  _StubSync(super.queue, super.api);
  int flushes = 0;
  @override
  Future<SyncReport> flush() async {
    flushes++;
    return const SyncReport();
  }
}

void main() {
  late FakeOfflineQueue queue;
  late _MockApiService api;
  late _StubSync sync;
  late ClosingRepository repo;

  setUp(() {
    queue = FakeOfflineQueue();
    api = _MockApiService();
    sync = _StubSync(queue, api);
    repo = ClosingRepository(queue: queue, sync: sync, api: api);
  });

  test('addSale enqueues a sale mutation then triggers a flush', () async {
    await repo.addSale(branchId: 1, today: '2026-06-14', paymentChannelId: 4, amount: 500);
    final pending = await queue.pending();
    expect(pending.single.kind, MutationKind.sale);
    expect(pending.single.saleAmount, 500);
    expect(sync.flushes, 1);
  });

  test('addExpense enqueues an expense mutation then flushes', () async {
    await repo.addExpense(branchId: 1, today: '2026-06-14', expenseCategoryId: 7,
        description: 'Rent', amount: 300, paymentMethod: 'cash');
    final pending = await queue.pending();
    expect(pending.single.kind, MutationKind.expense);
    expect(pending.single.expenseAmount, 300);
    expect(sync.flushes, 1);
  });

  test('detail delegates to the api service', () async {
    final c = DailyClosing.fromJson(
        {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 0.0});
    when(() => api.detail(9)).thenAnswer((_) async => c);
    expect((await repo.detail(9)).id, 9);
    verify(() => api.detail(9)).called(1);
  });
}
