import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/pending_mutation.dart';
import 'package:closebalance_mobile/data/remote/closing_api_service.dart';
import 'package:closebalance_mobile/data/sync/sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../support/fake_offline_queue.dart';

class _MockApiService extends Mock implements ClosingApiService {}

DailyClosing _c() => DailyClosing.fromJson(
    {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 0.0});

void main() {
  late FakeOfflineQueue queue;
  late _MockApiService api;
  late SyncService sync;

  setUp(() {
    queue = FakeOfflineQueue();
    api = _MockApiService();
    sync = SyncService(queue, api);
  });

  test('replays a queued sale and removes it', () async {
    await queue.enqueue(kind: MutationKind.sale, branchId: 1, date: '2026-06-14',
        payload: {'payment_channel_id': 4, 'amount': 500});
    when(() => api.addSaleOnline(branchId: 1, today: '2026-06-14',
        paymentChannelId: 4, amount: 500)).thenAnswer((_) async => _c());

    final report = await sync.flush();

    expect(report.synced, 1);
    expect(await queue.count(), 0);
  });

  test('stops on a network error and keeps the entry', () async {
    await queue.enqueue(kind: MutationKind.sale, branchId: 1, date: '2026-06-14',
        payload: {'payment_channel_id': 4, 'amount': 500});
    when(() => api.addSaleOnline(branchId: any(named: 'branchId'), today: any(named: 'today'),
        paymentChannelId: any(named: 'paymentChannelId'), amount: any(named: 'amount')))
        .thenThrow(AppException.network());

    final report = await sync.flush();

    expect(report.synced, 0);
    expect(report.remaining, 1);
    expect(await queue.count(), 1);
  });

  test('discards an entry rejected by validation so the queue is not stuck', () async {
    await queue.enqueue(kind: MutationKind.expense, branchId: 1, date: '2026-06-14',
        payload: {'expense_category_id': 7, 'description': 'x', 'amount': 1, 'payment_method': 'cash'});
    when(() => api.addExpenseOnline(branchId: any(named: 'branchId'), today: any(named: 'today'),
        expenseCategoryId: any(named: 'expenseCategoryId'), description: any(named: 'description'),
        amount: any(named: 'amount'), paymentMethod: any(named: 'paymentMethod'),
        remarks: any(named: 'remarks')))
        .thenThrow(AppException(kind: AppExceptionKind.validation, message: 'bad'));

    final report = await sync.flush();

    expect(report.discarded, 1);
    expect(await queue.count(), 0);
  });
}
