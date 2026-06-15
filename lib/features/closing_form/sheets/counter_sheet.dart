import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';

Future<({int counterId, double saleAmount, double paidAmount, String? remarks})?>
    showCounterSheet(
  BuildContext context, {
  int? initialCounterId,
  double? initialSaleAmount,
  double? initialPaidAmount,
  String? initialRemarks,
}) {
  return showModalBottomSheet<
      ({int counterId, double saleAmount, double paidAmount, String? remarks})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _CounterSheet(
      initialCounterId: initialCounterId,
      initialSaleAmount: initialSaleAmount,
      initialPaidAmount: initialPaidAmount,
      initialRemarks: initialRemarks,
    ),
  );
}

class _CounterSheet extends ConsumerStatefulWidget {
  const _CounterSheet({
    this.initialCounterId,
    this.initialSaleAmount,
    this.initialPaidAmount,
    this.initialRemarks,
  });

  final int? initialCounterId;
  final double? initialSaleAmount;
  final double? initialPaidAmount;
  final String? initialRemarks;

  @override
  ConsumerState<_CounterSheet> createState() => _CounterSheetState();
}

class _CounterSheetState extends ConsumerState<_CounterSheet> {
  int? _counterId;
  final _saleCtrl = TextEditingController();
  final _paidCtrl = TextEditingController();
  final _remarksCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  double get _balance {
    final sale = double.tryParse(_saleCtrl.text) ?? 0.0;
    final paid = double.tryParse(_paidCtrl.text) ?? 0.0;
    return sale - paid;
  }

  @override
  void initState() {
    super.initState();
    _counterId = widget.initialCounterId;
    if (widget.initialSaleAmount != null) {
      _saleCtrl.text = widget.initialSaleAmount!.toStringAsFixed(2);
    }
    if (widget.initialPaidAmount != null) {
      _paidCtrl.text = widget.initialPaidAmount!.toStringAsFixed(2);
    }
    _remarksCtrl.text = widget.initialRemarks ?? '';
    _saleCtrl.addListener(_onAmountChanged);
    _paidCtrl.addListener(_onAmountChanged);
  }

  void _onAmountChanged() => setState(() {});

  @override
  void dispose() {
    _saleCtrl.removeListener(_onAmountChanged);
    _paidCtrl.removeListener(_onAmountChanged);
    _saleCtrl.dispose();
    _paidCtrl.dispose();
    _remarksCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final refData = ref.watch(referenceDataProvider);
    final counters = refData.value?.counters ?? const [];
    final currencySymbol = refData.value?.currencySymbol ?? '';

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
            Text('Counter Transaction', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              initialValue: _counterId,
              decoration: const InputDecoration(labelText: 'Counter'),
              items: counters
                  .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                  .toList(),
              onChanged: (v) => setState(() => _counterId = v),
              validator: (v) => v == null ? 'Select a counter' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _saleCtrl,
              decoration: const InputDecoration(labelText: 'Sale Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                final n = double.tryParse(v ?? '');
                return (n == null || n < 0) ? 'Enter a valid amount' : null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _paidCtrl,
              decoration: const InputDecoration(labelText: 'Paid Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                final n = double.tryParse(v ?? '');
                return (n == null || n < 0) ? 'Enter a valid amount' : null;
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Balance: ${formatMoney(_balance, currencySymbol)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _remarksCtrl,
              decoration: const InputDecoration(labelText: 'Remarks (optional)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop((
                    counterId: _counterId!,
                    saleAmount: double.parse(_saleCtrl.text),
                    paidAmount: double.parse(_paidCtrl.text),
                    remarks: _remarksCtrl.text.trim().isEmpty ? null : _remarksCtrl.text.trim(),
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
