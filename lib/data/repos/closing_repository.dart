import '../local/offline_queue.dart';
import '../models/daily_closing.dart';
import '../models/paginated.dart';
import '../models/pending_mutation.dart';
import '../remote/closing_api_service.dart';
import '../sync/sync_service.dart';

/// Offline-aware façade. Writes (today's sales/expenses) are queued locally and
/// then flushed; reads/finalize go straight to the API (today-scoped offline).
class ClosingRepository {
  ClosingRepository({
    required OfflineQueue queue,
    required SyncService sync,
    required ClosingApiService api,
  })  : _queue = queue, // ignore: prefer_initializing_formals
        _sync = sync, // ignore: prefer_initializing_formals
        _api = api; // ignore: prefer_initializing_formals

  final OfflineQueue _queue;
  final SyncService _sync;
  final ClosingApiService _api;

  Future<void> addSale({
    required int branchId,
    required String today,
    required int paymentChannelId,
    required num amount,
  }) async {
    await _queue.enqueue(
      kind: MutationKind.sale,
      branchId: branchId,
      date: today,
      payload: {'payment_channel_id': paymentChannelId, 'amount': amount},
    );
    await _sync.flush();
  }

  Future<void> addExpense({
    required int branchId,
    required String today,
    required int expenseCategoryId,
    required String description,
    required num amount,
    required String paymentMethod,
    String? remarks,
  }) async {
    await _queue.enqueue(
      kind: MutationKind.expense,
      branchId: branchId,
      date: today,
      payload: {
        'expense_category_id': expenseCategoryId,
        'description': description,
        'amount': amount,
        'payment_method': paymentMethod,
        if (remarks != null) 'remarks': remarks, // ignore: use_null_aware_elements
      },
    );
    await _sync.flush();
  }

  Future<DailyClosing> finalize(int closingId) => _api.finalize(closingId);

  Future<Paginated<DailyClosing>> list({
    String? dateFrom,
    String? dateTo,
    int? branchId,
    String? status,
    int page = 1,
  }) =>
      _api.list(dateFrom: dateFrom, dateTo: dateTo, branchId: branchId, status: status, page: page);

  Future<DailyClosing> detail(int id) => _api.detail(id);

  Future<int> pendingCount({int? branchId, String? date}) =>
      _queue.count(branchId: branchId, date: date);
}
