import 'package:closebalance_mobile/data/remote/closings_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDio extends Mock implements Dio {}

Response<dynamic> _res(String path, dynamic data, [int code = 200]) => Response(
      requestOptions: RequestOptions(path: path),
      statusCode: code,
      data: data,
    );

void main() {
  late _MockDio dio;
  late ClosingsApi api;

  setUp(() {
    dio = _MockDio();
    api = ClosingsApi(dio);
  });

  test('index parses paginated list', () async {
    when(() => dio.get('/daily-closings', queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => _res('/daily-closings', {
              'data': [
                {'id': 1, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 100.0,
                 'branch': {'id': 1, 'name': 'Main'}, 'created_at': '2026-06-14T00:00:00+00:00'},
              ],
              'meta': {'current_page': 1, 'last_page': 2, 'per_page': 15, 'total': 20},
            }));

    final page = await api.index(dateFrom: '2026-06-01', dateTo: '2026-06-14');
    expect(page.items.single.id, 1);
    expect(page.meta.hasMore, isTrue);
  });

  test('store posts and parses the data-wrapped detail', () async {
    when(() => dio.post('/daily-closings', data: any(named: 'data')))
        .thenAnswer((_) async => _res('/daily-closings', {
              'data': {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 0.0,
                       'branch': {'id': 1, 'name': 'Main'}},
            }, 201));

    final c = await api.store(branchId: 1, date: '2026-06-14', totalSales: 0);
    expect(c.id, 9);
    verify(() => dio.post('/daily-closings', data: {
          'branch_id': 1, 'date': '2026-06-14', 'total_sales': 0,
        })).called(1);
  });

  test('show, update, finalize unwrap data', () async {
    when(() => dio.get('/daily-closings/9')).thenAnswer((_) async =>
        _res('/daily-closings/9', {'data': {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 50.0}}));
    when(() => dio.put('/daily-closings/9', data: any(named: 'data'))).thenAnswer((_) async =>
        _res('/daily-closings/9', {'data': {'id': 9, 'date': '2026-06-14', 'status': 'draft', 'total_sales': 70.0}}));
    when(() => dio.post('/daily-closings/9/finalize')).thenAnswer((_) async =>
        _res('/daily-closings/9/finalize', {'data': {'id': 9, 'date': '2026-06-14', 'status': 'finalized', 'total_sales': 70.0}}));

    expect((await api.show(9)).totalSales, 50.0);
    expect((await api.update(9, totalSales: 70)).totalSales, 70.0);
    expect((await api.finalize(9)).status.name, 'finalized');
  });
}
