import 'package:flutter/material.dart';
import '../closing_form_controller.dart';

class ExpensesTab extends StatelessWidget {
  const ExpensesTab({super.key, required this.arg, required this.currencySymbol});
  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
