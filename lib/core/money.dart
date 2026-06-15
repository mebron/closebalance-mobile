/// Formats an amount with a currency symbol and thousands separators.
/// Whole numbers show no decimals; fractional amounts show exactly two.
String formatMoney(num amount, String symbol) {
  final isWhole = amount == amount.roundToDouble();
  final fixed = isWhole ? amount.toStringAsFixed(0) : amount.toStringAsFixed(2);
  final parts = fixed.split('.');
  final intPart = parts[0];
  final neg = intPart.startsWith('-');
  final digits = neg ? intPart.substring(1) : intPart;

  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) {
      buffer.write(',');
    }
    buffer.write(digits[i]);
  }

  final grouped = buffer.toString();
  final decimals = parts.length > 1 ? '.${parts[1]}' : '';
  return '${neg ? '-' : ''}$symbol$grouped$decimals';
}
