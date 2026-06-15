import 'package:closebalance_mobile/data/models/counter.dart';
import 'package:closebalance_mobile/data/models/deduction_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Counter parses with nullable branch', () {
    final c = Counter.fromJson({'id': 3, 'name': 'Counter 1', 'branch_id': 2});
    expect(c.id, 3);
    expect(c.name, 'Counter 1');
    expect(c.branchId, 2);
  });

  test('DeductionType maps value<->label', () {
    expect(DeductionType.fromValue('incentive'), DeductionType.incentive);
    expect(DeductionType.incentive.label, 'Incentive');
    expect(DeductionType.fromValue('unknown'), DeductionType.other);
  });
}
