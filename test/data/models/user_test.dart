import 'package:closebalance_mobile/data/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('User.fromJson parses the API user shape', () {
    final user = User.fromJson({
      'id': 1,
      'name': 'Mujeeb',
      'email': 'mujeeb@mebron.com',
      'branch_id': null,
      'roles': ['admin'],
      'company': {'id': 7, 'name': 'CupCake', 'currency_symbol': '₹'},
    });

    expect(user.id, 1);
    expect(user.name, 'Mujeeb');
    expect(user.branchId, isNull);
    expect(user.roles, ['admin']);
    expect(user.company.currencySymbol, '₹');
    expect(user.isBranchLocked, isFalse);
  });

  test('isBranchLocked is true when branch_id is set', () {
    final user = User.fromJson({
      'id': 2,
      'name': 'Cashier',
      'email': 'c@x.com',
      'branch_id': 3,
      'roles': ['cashier'],
      'company': {'id': 7, 'name': 'CupCake', 'currency_symbol': '₹'},
    });

    expect(user.isBranchLocked, isTrue);
    expect(user.branchId, 3);
  });
}
