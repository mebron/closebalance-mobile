import 'package:closebalance_mobile/data/remote/expenses_api.dart';
import 'package:closebalance_mobile/data/remote/sales_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

Response<dynamic> _res(String p, dynamic d, [int c = 201]) =>
    Response(requestOptions: RequestOptions(path: p), statusCode: c, data: d);

void main() {
  late _MockDio dio;

  setUp(() => dio = _MockDio());

  test('SalesApi.create posts payment_channel_id + amount', () async {
    when(() => dio.post('/daily-closings/9/sales', data: any(named: 'data')))
        .thenAnswer((_) async => _res('/daily-closings/9/sales', {
              'data': {'id': 1, 'payment_channel_id': 4,
                       'payment_channel': {'id': 4, 'name': 'Cash', 'type': 'cash'},
                       'amount': 2000.0},
            }));

    final s = await SalesApi(dio).create(closingId: 9, paymentChannelId: 4, amount: 2000);
    expect(s.amount, 2000.0);
    verify(() => dio.post('/daily-closings/9/sales',
        data: {'payment_channel_id': 4, 'amount': 2000})).called(1);
  });

  test('ExpensesApi.create posts the full body', () async {
    when(() => dio.post('/daily-closings/9/expenses', data: any(named: 'data')))
        .thenAnswer((_) async => _res('/daily-closings/9/expenses', {
              'data': {'id': 1, 'expense_category_id': 7, 'category': {'id': 7, 'name': 'Rent'},
                       'description': 'Rent', 'amount': 300.0, 'payment_channel_id': 1, 'paid_via': 'Cash Counter', 'remarks': null},
            }));

    final e = await ExpensesApi(dio).create(
      closingId: 9, expenseCategoryId: 7, description: 'Rent', amount: 300, paymentChannelId: 1);
    expect(e.paymentChannelId, 1);
    expect(e.paidVia, 'Cash Counter');
    verify(() => dio.post('/daily-closings/9/expenses', data: {
          'expense_category_id': 7, 'description': 'Rent', 'amount': 300, 'payment_channel_id': 1,
        })).called(1);
  });
}
