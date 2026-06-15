import 'package:closebalance_mobile/core/money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('formats with the currency symbol and thousands separators', () {
    expect(formatMoney(25000, '₹'), '₹25,000');
    expect(formatMoney(1550.5, '₹'), '₹1,550.50');
    expect(formatMoney(0, r'$'), r'$0');
  });
}
