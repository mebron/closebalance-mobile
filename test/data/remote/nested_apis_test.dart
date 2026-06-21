import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';
import 'package:closebalance_mobile/data/remote/counter_transactions_api.dart';
import 'package:closebalance_mobile/data/remote/deductions_api.dart';
import 'package:closebalance_mobile/data/remote/expenses_api.dart';
import 'package:closebalance_mobile/data/remote/sales_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

Response<dynamic> _res(String p, dynamic d, [int c = 200]) =>
    Response(requestOptions: RequestOptions(path: p), statusCode: c, data: d);

void main() {
  late _MockDio dio;
  setUp(() => dio = _MockDio());

  test('SalesApi.update PUTs amount/channel', () async {
    when(() => dio.put('/daily-closings/9/sales/5', data: any(named: 'data'))).thenAnswer((_) async =>
        _res('/x', {'data': {'id': 5, 'payment_channel_id': 4, 'amount': 999.0}}));
    final s = await SalesApi(dio).update(closingId: 9, saleId: 5, paymentChannelId: 4, amount: 999);
    expect(s.amount, 999.0);
    verify(() => dio.put('/daily-closings/9/sales/5', data: {'payment_channel_id': 4, 'amount': 999})).called(1);
  });

  test('DeductionsApi.create POSTs the body', () async {
    when(() => dio.post('/daily-closings/9/deductions', data: any(named: 'data'))).thenAnswer((_) async =>
        _res('/x', {'data': {'id': 1, 'type': 'incentive', 'description': 'x', 'amount': 100.0, 'payment_channel_id': 1}}, 201));
    final d = await DeductionsApi(dio).create(
        closingId: 9, type: 'incentive', description: 'x', amount: 100, paymentChannelId: 1);
    expect(d.type, 'incentive');
    verify(() => dio.post('/daily-closings/9/deductions',
        data: {'type': 'incentive', 'description': 'x', 'amount': 100, 'payment_channel_id': 1})).called(1);
  });

  test('CounterTransactionsApi.create POSTs the body', () async {
    when(() => dio.post('/daily-closings/9/counter-transactions', data: any(named: 'data'))).thenAnswer((_) async =>
        _res('/x', {'data': {'id': 1, 'counter_id': 2, 'date': '2026-06-15', 'sale_amount': 500.0, 'paid_amount': 150.0, 'balance': 350.0}}, 201));
    final payments = [const EditablePayment(amount: 150, paymentMethod: 'cash')];
    final t = await CounterTransactionsApi(dio).create(
        closingId: 9, counterId: 2, date: '2026-06-15', saleAmount: 500, payments: payments);
    expect(t.balance, 350.0);
    verify(() => dio.post('/daily-closings/9/counter-transactions',
        data: {
          'counter_id': 2,
          'date': '2026-06-15',
          'sale_amount': 500,
          'payments': [{'amount': 150, 'method': 'cash'}],
        })).called(1);
  });

  test('ExpensesApi.update PUTs fields', () async {
    when(() => dio.put('/daily-closings/9/expenses/3', data: any(named: 'data'))).thenAnswer((_) async =>
        _res('/x', {'data': {'id': 3, 'expense_category_id': 7, 'description': 'Rent', 'amount': 50.0, 'payment_channel_id': 2, 'paid_via': 'Bank Transfer', 'remarks': null}}));
    final e = await ExpensesApi(dio).update(
        closingId: 9, expenseId: 3, expenseCategoryId: 7, description: 'Rent', amount: 50, paymentChannelId: 2);
    expect(e.paymentChannelId, 2);
    expect(e.paidVia, 'Bank Transfer');
  });
}
