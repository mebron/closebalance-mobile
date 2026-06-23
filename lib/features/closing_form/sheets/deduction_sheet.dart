import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';
import '../../../data/models/deduction_type.dart';

Future<({String type, String description, double amount, int paymentChannelId})?>
    showDeductionSheet(
  BuildContext context, {
  String? initialType,
  String? initialDescription,
  double? initialAmount,
  int? initialPaymentChannelId,
}) {
  return showModalBottomSheet<
      ({String type, String description, double amount, int paymentChannelId})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _DeductionSheet(
      initialType: initialType,
      initialDescription: initialDescription,
      initialAmount: initialAmount,
      initialPaymentChannelId: initialPaymentChannelId,
    ),
  );
}

class _DeductionSheet extends ConsumerStatefulWidget {
  const _DeductionSheet({
    this.initialType,
    this.initialDescription,
    this.initialAmount,
    this.initialPaymentChannelId,
  });

  final String? initialType;
  final String? initialDescription;
  final double? initialAmount;
  final int? initialPaymentChannelId;

  @override
  ConsumerState<_DeductionSheet> createState() => _DeductionSheetState();
}

class _DeductionSheetState extends ConsumerState<_DeductionSheet> {
  String? _type;
  final _descCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  int? _paymentChannelId;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
    _descCtrl.text = widget.initialDescription ?? '';
    if (widget.initialAmount != null) {
      _amountCtrl.text = widget.initialAmount!.toStringAsFixed(2);
    }
    _paymentChannelId = widget.initialPaymentChannelId;
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
    final channels = refData.value?.paymentChannels
        .where((c) => c.type != 'aggregator')
        .toList();

    return SafeArea(
      top: false,
      child: Padding(
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
              value: _type,
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
            if (channels == null)
              const LinearProgressIndicator()
            else
              DropdownButtonFormField<int>(
                value: _paymentChannelId,
                decoration: const InputDecoration(labelText: 'Paid Via'),
                items: channels
                    .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                    .toList(),
                onChanged: (v) => setState(() => _paymentChannelId = v),
                validator: (v) => v == null ? 'Select a payment channel' : null,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop((
                    type: _type!,
                    description: _descCtrl.text.trim(),
                    amount: double.parse(_amountCtrl.text),
                    paymentChannelId: _paymentChannelId!,
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
