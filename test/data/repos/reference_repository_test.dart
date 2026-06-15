import 'package:closebalance_mobile/data/models/branch.dart';
import 'package:closebalance_mobile/data/models/counter.dart';
import 'package:closebalance_mobile/data/models/expense_category.dart';
import 'package:closebalance_mobile/data/models/payment_channel.dart';
import 'package:closebalance_mobile/data/remote/reference_api.dart';
import 'package:closebalance_mobile/data/repos/reference_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockReferenceApi extends Mock implements ReferenceApi {}

void main() {
  late _MockReferenceApi api;
  late ReferenceRepository repo;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    api = _MockReferenceApi();
    repo = ReferenceRepository(api);

    when(() => api.branches()).thenAnswer(
        (_) async => const [Branch(id: 1, name: 'Main')]);
    when(() => api.paymentChannels()).thenAnswer(
        (_) async => const [PaymentChannel(id: 1, name: 'Cash', type: 'cash')]);
    when(() => api.expenseCategories()).thenAnswer(
        (_) async => const [ExpenseCategory(id: 1, name: 'Rent')]);
    when(() => api.currencySymbol()).thenAnswer((_) async => '₹');
    when(() => api.counters()).thenAnswer(
        (_) async => const [Counter(id: 1, name: 'C1')]);
  });

  test('refresh fetches all reference data and caches it', () async {
    final data = await repo.refresh();

    expect(data.branches.single.name, 'Main');
    expect(data.paymentChannels.single.type, 'cash');
    expect(data.currencySymbol, '₹');

    final cached = await ReferenceRepository(api).cached();
    expect(cached, isNotNull);
    expect(cached!.expenseCategories.single.name, 'Rent');
  });

  test('cached returns null when nothing is stored', () async {
    expect(await repo.cached(), isNull);
  });
}
