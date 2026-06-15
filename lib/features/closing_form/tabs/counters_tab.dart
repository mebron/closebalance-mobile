import 'package:flutter/material.dart';
import '../closing_form_controller.dart';

class CountersTab extends StatelessWidget {
  const CountersTab({super.key, required this.arg, required this.currencySymbol});
  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  Widget build(BuildContext context) => const SizedBox.shrink();
}
