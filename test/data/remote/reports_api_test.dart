import 'package:closebalance_mobile/data/remote/reports_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

Response<dynamic> _res(String p, dynamic d) =>
    Response(requestOptions: RequestOptions(path: p), statusCode: 200, data: d);

void main() {
  late _MockDio dio;
  late ReportsApi api;

  setUp(() {
    dio = _MockDio();
    api = ReportsApi(dio);
  });

  test('summary parses flat object', () async {
    when(() => dio.get('/reports/summary', queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => _res('/reports/summary', {
              'date': '2026-06-14', 'total_sales': 25000.0, 'cash_in_hand': 8500.0,
              'draft_closings': 1, 'finalized_closings': 0, 'total_expenses': 1200.0,
              'net_position': 23800.0,
            }));

    final s = await api.summary(date: '2026-06-14', branchId: 2);
    expect(s.totalSales, 25000.0);
    verify(() => dio.get('/reports/summary',
        queryParameters: {'date': '2026-06-14', 'branch_id': 2})).called(1);
  });

  test('expensesByCategory parses the data array', () async {
    when(() => dio.get('/reports/expenses', queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => _res('/reports/expenses', {
              'data': [{'category': 'Rent', 'total': 300.0, 'count': 2}],
            }));

    final rows = await api.expensesByCategory(dateFrom: '2026-06-01', dateTo: '2026-06-14');
    expect(rows.single.category, 'Rent');
  });
}
