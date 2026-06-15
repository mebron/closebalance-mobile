import 'package:flutter/material.dart';
import '../../../data/models/deduction_type.dart';

Future<({String type, String description, double amount, String paymentMethod})?>
    showDeductionSheet(
  BuildContext context, {
  String? initialType,
  String? initialDescription,
  double? initialAmount,
  String? initialPaymentMethod,
}) {
  return showModalBottomSheet<
      ({String type, String description, double amount, String paymentMethod})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _DeductionSheet(
      initialType: initialType,
      initialDescription: initialDescription,
      initialAmount: initialAmount,
      initialPaymentMethod: initialPaymentMethod,
    ),
  );
}

class _DeductionSheet extends StatefulWidget {
  const _DeductionSheet({
    this.initialType,
    this.initialDescription,
    this.initialAmount,
    this.initialPaymentMethod,
  });

  final String? initialType;
  final String? initialDescription;
  final double? initialAmount;
  final String? initialPaymentMethod;

  @override
  State<_DeductionSheet> createState() => _DeductionSheetState();
}

class _DeductionSheetState extends State<_DeductionSheet> {
  String? _type;
  final _descCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  String _paymentMethod = 'cash';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
    _descCtrl.text = widget.initialDescription ?? '';
    if (widget.initialAmount != null) {
      _amountCtrl.text = widget.initialAmount!.toStringAsFixed(2);
    }
    _paymentMethod = widget.initialPaymentMethod ?? 'cash';
  }

  @override
  void dispose() {
    _descCtrl.dispose();
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Deduction', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _type,
              decoration: const InputDecoration(labelText: 'Type'),
              items: DeductionType.values
                  .map((t) => DropdownMenuItem(value: t.value, child: Text(t.label)))
                  .toList(),
              onChanged: (v) => setState(() => _type = v),
              validator: (v) => v == null ? 'Select a type' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                final n = double.tryParse(v ?? '');
                return (n == null || n <= 0) ? 'Enter a valid amount' : null;
              },
            ),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'cash', label: Text('Cash')),
                ButtonSegment(value: 'bank', label: Text('Bank')),
              ],
              selected: {_paymentMethod},
              onSelectionChanged: (s) => setState(() => _paymentMethod = s.first),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop((
                    type: _type!,
                    description: _descCtrl.text.trim(),
                    amount: double.parse(_amountCtrl.text),
                    paymentMethod: _paymentMethod,
                  ));
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
