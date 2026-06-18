import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';

Future<({int categoryId, String? description, double amount, String paymentMethod})?>
    showExpenseSheet(
  BuildContext context, {
  int? initialCategoryId,
  String? initialDescription,
  double? initialAmount,
  String? initialPaymentMethod,
}) {
  return showModalBottomSheet<
      ({int categoryId, String? description, double amount, String paymentMethod})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _ExpenseSheet(
      initialCategoryId: initialCategoryId,
      initialDescription: initialDescription,
      initialAmount: initialAmount,
      initialPaymentMethod: initialPaymentMethod,
    ),
  );
}

class _ExpenseSheet extends ConsumerStatefulWidget {
  const _ExpenseSheet({
    this.initialCategoryId,
    this.initialDescription,
    this.initialAmount,
    this.initialPaymentMethod,
  });

  final int? initialCategoryId;
  final String? initialDescription;
  final double? initialAmount;
  final String? initialPaymentMethod;

  @override
  ConsumerState<_ExpenseSheet> createState() => _ExpenseSheetState();
}

class _ExpenseSheetState extends ConsumerState<_ExpenseSheet> {
  int? _categoryId;
  final _descCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  String _paymentMethod = 'cash';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _categoryId = widget.initialCategoryId;
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
    final refData = ref.watch(referenceDataProvider);
    // null means still loading — don't pass an empty list to DropdownButton,
    // which would disable its tap handler and make the dropdown unresponsive.
    final categories = refData.value?.expenseCategories;

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
            Text('Expense', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            if (categories == null)
              const LinearProgressIndicator()
            else
              DropdownButtonFormField<int>(
                initialValue: _categoryId,
                decoration: const InputDecoration(labelText: 'Category'),
                items: categories
                    .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                    .toList(),
                onChanged: (v) => setState(() => _categoryId = v),
                validator: (v) => v == null ? 'Select a category' : null,
              ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descCtrl,
              decoration: const InputDecoration(labelText: 'Description (optional)'),
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
                  final desc = _descCtrl.text.trim();
                  Navigator.of(context).pop((
                    categoryId: _categoryId!,
                    description: desc.isEmpty ? null : desc,
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
