import '../../core/error/app_exception.dart';
import '../local/offline_queue.dart';
import '../models/pending_mutation.dart';
import '../remote/closing_api_service.dart';

class SyncReport {
  const SyncReport({this.synced = 0, this.discarded = 0, this.remaining = 0});
  final int synced;
  final int discarded;
  final int remaining;
}

/// Drains the offline queue by replaying each mutation through the online API.
/// Stops on the first network error (entries stay queued); discards entries the
/// server rejects with a non-network error so one bad entry can't block sync.
class SyncService {
  SyncService(this._queue, this._api);

  final OfflineQueue _queue;
  final ClosingApiService _api;

  bool _running = false;

  Future<SyncReport> flush() async {
    if (_running) {
      return SyncReport(remaining: await _queue.count());
    }
    _running = true;
    try {
      var synced = 0;
      var discarded = 0;

      for (final m in await _queue.pending()) {
        try {
          await _replay(m);
          await _queue.remove(m.id);
          synced++;
        } on AppException catch (e) {
          if (e.kind == AppExceptionKind.network) {
            break;
          }
          await _queue.remove(m.id);
          discarded++;
        }
      }

      return SyncReport(
          synced: synced, discarded: discarded, remaining: await _queue.count());
    } finally {
      _running = false;
    }
  }

  Future<void> _replay(PendingMutation m) {
    switch (m.kind) {
      case MutationKind.sale:
        return _api.addSaleOnline(
          branchId: m.branchId,
          today: m.date,
          paymentChannelId: m.paymentChannelId,
          amount: m.saleAmount,
        );
      case MutationKind.expense:
        return _api.addExpenseOnline(
          branchId: m.branchId,
          today: m.date,
          expenseCategoryId: m.expenseCategoryId,
          description: m.description,
          amount: m.expenseAmount,
          paymentMethod: m.paymentMethod,
          remarks: m.remarks,
        );
    }
  }
}
