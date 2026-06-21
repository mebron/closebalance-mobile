import '../models/daily_closing.dart';
import '../models/paginated.dart';
import 'closings_api.dart';
import 'expenses_api.dart';
import 'sales_api.dart';

/// Online orchestration for daily closings. Shared by the repository (online
/// path) and the sync service (replaying queued mutations).
class ClosingApiService {
  ClosingApiService(this._closings, this._sales, this._expenses);

  final ClosingsApi _closings;
  final SalesApi _sales;
  final ExpensesApi _expenses;

  Future<DailyClosing> ensureTodayClosing({
    required int branchId,
    required String today,
  }) async {
    final page = await _closings.index(dateFrom: today, dateTo: today, branchId: branchId);
    if (page.items.isNotEmpty) {
      return _closings.show(page.items.first.id);
    }
    return _closings.store(branchId: branchId, date: today, totalSales: 0);
  }

  Future<DailyClosing> addSaleOnline({
    required int branchId,
    required String today,
    required int paymentChannelId,
    required num amount,
  }) async {
    final closing = await ensureTodayClosing(branchId: branchId, today: today);
    await _sales.create(
        closingId: closing.id, paymentChannelId: paymentChannelId, amount: amount);
    return _closings.update(closing.id, totalSales: closing.totalSales + amount);
  }

  Future<DailyClosing> addExpenseOnline({
    required int branchId,
    required String today,
    required int expenseCategoryId,
    required String description,
    required num amount,
    required int paymentChannelId,
    String? remarks,
  }) async {
    final closing = await ensureTodayClosing(branchId: branchId, today: today);
    await _expenses.create(
      closingId: closing.id,
      expenseCategoryId: expenseCategoryId,
      description: description,
      amount: amount,
      paymentChannelId: paymentChannelId,
      remarks: remarks,
    );
    return _closings.show(closing.id);
  }

  Future<DailyClosing> finalize(int closingId) => _closings.finalize(closingId);

  Future<Paginated<DailyClosing>> list({
    String? dateFrom,
    String? dateTo,
    int? branchId,
    String? status,
    int page = 1,
  }) =>
      _closings.index(
          dateFrom: dateFrom, dateTo: dateTo, branchId: branchId, status: status, page: page);

  Future<DailyClosing> detail(int id) => _closings.show(id);
}
