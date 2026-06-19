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

  test('canFinalize is true for admin and manager roles', () {
    for (final role in ['super_admin', 'admin', 'manager']) {
      final user = User.fromJson({
        'id': 1, 'name': 'U', 'email': 'u@x.com', 'branch_id': null,
        'roles': [role],
        'company': {'id': 1, 'name': 'C', 'currency_symbol': '₹'},
      });
      expect(user.canFinalize, isTrue, reason: 'role: $role');
    }
  });

  test('canFinalize is false for data_entry_operator only', () {
    final user = User.fromJson({
      'id': 1, 'name': 'U', 'email': 'u@x.com', 'branch_id': null,
      'roles': ['data_entry_operator'],
      'company': {'id': 1, 'name': 'C', 'currency_symbol': '₹'},
    });
    expect(user.canFinalize, isFalse);
  });

  test('canFinalize is true for multi-role user with admin + data_entry_operator', () {
    final user = User.fromJson({
      'id': 1, 'name': 'U', 'email': 'u@x.com', 'branch_id': null,
      'roles': ['admin', 'data_entry_operator', 'panel_user', 'manager'],
      'company': {'id': 1, 'name': 'C', 'currency_symbol': '₹'},
    });
    expect(user.canFinalize, isTrue);
  });
}
