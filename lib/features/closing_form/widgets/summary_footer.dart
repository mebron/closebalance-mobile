import 'package:flutter/material.dart';
import '../../../core/money.dart';

import '../../../data/models/editable/editable_closing.dart';
import '../../../data/sync/closing_math.dart';

class SummaryFooter extends StatelessWidget {
  const SummaryFooter({
    super.key,
    required this.closing,
    required this.currencySymbol,
    required this.channelTypes,
  });

  final EditableClosing closing;
  final String currencySymbol;
  final Map<int, String> channelTypes;

  @override
  Widget build(BuildContext context) {
    final cashInHand = ClosingMath.cashInHand(closing, channelTypes);
    final expenses = ClosingMath.totalExpenses(closing);
    final net = ClosingMath.netProfit(closing);

    final bottomInset = MediaQuery.of(context).padding.bottom;
    final primary = Theme.of(context).colorScheme.primary;
    final primaryDark = Color.alphaBlend(Colors.black.withValues(alpha: 0.3), primary);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primary, primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.fromLTRB(16, 10, 16, 10 + bottomInset),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _Item(label: 'Cash in Hand', value: formatMoney(cashInHand, currencySymbol)),
          _Item(label: 'Expenses', value: formatMoney(expenses, currencySymbol)),
          _Item(label: 'Net', value: formatMoney(net, currencySymbol)),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
