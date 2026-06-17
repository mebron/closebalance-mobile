import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';
import '../../../data/models/editable/editable_closing.dart';

Future<({int counterId, double saleAmount, List<EditablePayment> payments, String? remarks})?>
    showCounterSheet(
  BuildContext context, {
  int? initialCounterId,
  double? initialSaleAmount,
  List<EditablePayment>? initialPayments,
  String? initialRemarks,
}) {
  return showModalBottomSheet<
      ({int counterId, double saleAmount, List<EditablePayment> payments, String? remarks})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _CounterSheet(
      initialCounterId: initialCounterId,
      initialSaleAmount: initialSaleAmount,
      initialPayments: initialPayments,
      initialRemarks: initialRemarks,
    ),
  );
}

class _PaymentEntry {
  _PaymentEntry({required this.amountCtrl, required this.method});
  final TextEditingController amountCtrl;
  String method;
}

class _CounterSheet extends ConsumerStatefulWidget {
  const _CounterSheet({
    this.initialCounterId,
    this.initialSaleAmount,
    this.initialPayments,
    this.initialRemarks,
  });

  final int? initialCounterId;
  final double? initialSaleAmount;
  final List<EditablePayment>? initialPayments;
  final String? initialRemarks;

  @override
  ConsumerState<_CounterSheet> createState() => _CounterSheetState();
}

class _CounterSheetState extends ConsumerState<_CounterSheet> {
  int? _counterId;
  final _saleCtrl = TextEditingController();
  final _remarksCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<_PaymentEntry> _payments = [];

  double get _totalPaid =>
      _payments.fold(0.0, (s, e) => s + (double.tryParse(e.amountCtrl.text) ?? 0.0));

  double get _balance => (double.tryParse(_saleCtrl.text) ?? 0.0) - _totalPaid;

  @override
  void initState() {
    super.initState();
    _counterId = widget.initialCounterId;
    if (widget.initialSaleAmount != null) {
      _saleCtrl.text = widget.initialSaleAmount!.toStringAsFixed(2);
    }
    _remarksCtrl.text = widget.initialRemarks ?? '';

    final initial = widget.initialPayments;
    if (initial != null && initial.isNotEmpty) {
      for (final p in initial) {
        _payments.add(_PaymentEntry(
          amountCtrl: TextEditingController(text: p.amount.toStringAsFixed(2)),
          method: p.paymentMethod,
        ));
      }
    } else {
      _payments.add(_PaymentEntry(amountCtrl: TextEditingController(), method: 'cash'));
    }

    _saleCtrl.addListener(_rebuild);
    for (final p in _payments) {
      p.amountCtrl.addListener(_rebuild);
    }
  }

  void _rebuild() => setState(() {});

  void _addPayment() {
    setState(() {
      final entry = _PaymentEntry(amountCtrl: TextEditingController(), method: 'cash');
      entry.amountCtrl.addListener(_rebuild);
      _payments.add(entry);
    });
  }

  void _removePayment(int index) {
    setState(() {
      _payments[index].amountCtrl.removeListener(_rebuild);
      _payments[index].amountCtrl.dispose();
      _payments.removeAt(index);
    });
  }

  @override
  void dispose() {
    _saleCtrl.removeListener(_rebuild);
    _saleCtrl.dispose();
    _remarksCtrl.dispose();
    for (final p in _payments) {
      p.amountCtrl.removeListener(_rebuild);
      p.amountCtrl.dispose();
    }
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Counter Transaction', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                value: _counterId,
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
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text('Payments', style: Theme.of(context).textTheme.titleSmall),
                  ),
                  TextButton.icon(
                    onPressed: _addPayment,
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text('Add'),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ..._payments.asMap().entries.map((entry) {
                final i = entry.key;
                final p = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: TextFormField(
                          controller: p.amountCtrl,
                          decoration: InputDecoration(
                            labelText: 'Amount ${_payments.length > 1 ? '${i + 1}' : ''}',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          validator: (v) {
                            final n = double.tryParse(v ?? '');
                            return (n == null || n < 0) ? 'Enter amount' : null;
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 4,
                        child: DropdownButtonFormField<String>(
                          value: p.method,
                          decoration: const InputDecoration(labelText: 'Paid Via'),
                          items: const [
                            DropdownMenuItem(value: 'cash', child: Text('Cash')),
                            DropdownMenuItem(value: 'bank', child: Text('UPI / Bank')),
                          ],
                          onChanged: (v) => setState(() => p.method = v!),
                        ),
                      ),
                      if (_payments.length > 1)
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () => _removePayment(i),
                        ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 4),
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
                    final paymentsResult = _payments
                        .map((p) => EditablePayment(
                              amount: double.parse(p.amountCtrl.text),
                              paymentMethod: p.method,
                            ))
                        .toList();
                    Navigator.of(context).pop((
                      counterId: _counterId!,
                      saleAmount: double.parse(_saleCtrl.text),
                      payments: paymentsResult,
                      remarks: _remarksCtrl.text.trim().isEmpty ? null : _remarksCtrl.text.trim(),
                    ));
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
