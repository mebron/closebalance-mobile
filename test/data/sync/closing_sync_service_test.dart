import 'package:closebalance_mobile/core/error/app_exception.dart';
import 'package:closebalance_mobile/data/models/closing_status.dart';
import 'package:closebalance_mobile/data/models/daily_closing.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/models/paginated.dart';
import 'package:closebalance_mobile/data/models/sale_line.dart';
import 'package:closebalance_mobile/data/remote/closings_api.dart';
import 'package:closebalance_mobile/data/remote/counter_transactions_api.dart';
import 'package:closebalance_mobile/data/remote/deductions_api.dart';
import 'package:closebalance_mobile/data/remote/expenses_api.dart';
import 'package:closebalance_mobile/data/remote/sales_api.dart';
import 'package:closebalance_mobile/data/sync/closing_sync_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _Closings extends Mock implements ClosingsApi {}
class _Sales extends Mock implements SalesApi {}
class _Expenses extends Mock implements ExpensesApi {}
class _Deductions extends Mock implements DeductionsApi {}
class _Counters extends Mock implements CounterTransactionsApi {}

DailyClosing _fresh() => DailyClosing.fromJson({
      'id': 9, 'date': '2026-06-15', 'status': 'draft', 'total_sales': 12000.0,
      'branch': {'id': 1, 'name': 'Main'},
      'sales': [{'id': 5, 'payment_channel_id': 4, 'amount': 12000.0}],
    });
Paginated<DailyClosing> _page(List<DailyClosing> items) => Paginated(items: items,
    meta: PageMeta.fromJson({'current_page': 1, 'last_page': 1, 'per_page': 15, 'total': items.length}));

void main() {
  late _Closings closings; late _Sales sales; late _Expenses expenses;
  late _Deductions deductions; late _Counters counters; late ClosingSyncService svc;

  setUp(() {
    closings = _Closings(); sales = _Sales(); expenses = _Expenses();
    deductions = _Deductions(); counters = _Counters();
    svc = ClosingSyncService(closings, sales, expenses, deductions, counters);
    when(() => closings.show(9)).thenAnswer((_) async => _fresh());
  });

  test('creates closing when no serverId, creates new sale line, pulls fresh', () async {
    when(() => closings.store(branchId: 1, date: '2026-06-15', totalSales: 12000, notes: any(named: 'notes')))
        .thenAnswer((_) async => _fresh());
    when(() => sales.create(closingId: 9, paymentChannelId: 4, amount: 12000))
        .thenAnswer((_) async => const SaleLine(id: 5, paymentChannelId: 4, amount: 12000));

    final local = EditableClosing(
      branchId: 1, date: '2026-06-15', status: ClosingStatus.draft, totalSales: 12000,
      sales: const [EditableSale(clientId: 'a', paymentChannelId: 4, amount: 12000)],
    );
    final result = await svc.sync(local);

    expect(result.serverId, 9);
    expect(result.sales.single.serverId, 5);
    verify(() => closings.store(branchId: 1, date: '2026-06-15', totalSales: 12000, notes: null)).called(1);
    verify(() => sales.create(closingId: 9, paymentChannelId: 4, amount: 12000)).called(1);
  });

  test('updates a dirty line and deletes a removed line', () async {
    when(() => closings.update(9, totalSales: any(named: 'totalSales'), notes: any(named: 'notes')))
        .thenAnswer((_) async => _fresh());
    when(() => sales.update(closingId: 9, saleId: 5, paymentChannelId: 4, amount: 999))
        .thenAnswer((_) async => const SaleLine(id: 5, paymentChannelId: 4, amount: 999));
    when(() => sales.delete(closingId: 9, saleId: 6)).thenAnswer((_) async {});

    final local = EditableClosing(
      serverId: 9, branchId: 1, date: '2026-06-15', status: ClosingStatus.draft,
      totalSales: 12000, headerDirty: true,
      sales: const [
        EditableSale(clientId: 'a', serverId: 5, paymentChannelId: 4, amount: 999, dirty: true),
        EditableSale(clientId: 'b', serverId: 6, paymentChannelId: 4, amount: 1, deleted: true),
      ],
    );
    await svc.sync(local);

    verify(() => sales.update(closingId: 9, saleId: 5, paymentChannelId: 4, amount: 999)).called(1);
    verify(() => sales.delete(closingId: 9, saleId: 6)).called(1);
  });

  test('adopts the existing closing on a 422 duplicate', () async {
    when(() => closings.store(branchId: 1, date: '2026-06-15', totalSales: 12000, notes: any(named: 'notes')))
        .thenThrow(AppException(kind: AppExceptionKind.validation, message: 'duplicate'));
    when(() => closings.index(dateFrom: '2026-06-15', dateTo: '2026-06-15', branchId: 1))
        .thenAnswer((_) async => _page([_fresh()]));
    when(() => sales.create(closingId: 9, paymentChannelId: 4, amount: 12000))
        .thenAnswer((_) async => const SaleLine(id: 5, paymentChannelId: 4, amount: 12000));

    final local = EditableClosing(
      branchId: 1, date: '2026-06-15', status: ClosingStatus.draft, totalSales: 12000,
      sales: const [EditableSale(clientId: 'a', paymentChannelId: 4, amount: 12000)],
    );
    final result = await svc.sync(local);
    expect(result.serverId, 9);
    verify(() => sales.create(closingId: 9, paymentChannelId: 4, amount: 12000)).called(1);
  });
}
