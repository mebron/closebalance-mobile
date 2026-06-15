import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers.dart';

Future<({int channelId, double amount})?> showSaleSheet(
  BuildContext context,
  WidgetRef ref, {
  int? initialChannelId,
  double? initialAmount,
}) {
  return showModalBottomSheet<({int channelId, double amount})>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _SaleSheet(
      ref: ref,
      initialChannelId: initialChannelId,
      initialAmount: initialAmount,
    ),
  );
}

class _SaleSheet extends ConsumerStatefulWidget {
  const _SaleSheet({required this.ref, this.initialChannelId, this.initialAmount});
  final WidgetRef ref;
  final int? initialChannelId;
  final double? initialAmount;

  @override
  ConsumerState<_SaleSheet> createState() => _SaleSheetState();
}

class _SaleSheetState extends ConsumerState<_SaleSheet> {
  int? _channelId;
  final _amountCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _channelId = widget.initialChannelId;
    if (widget.initialAmount != null) {
      _amountCtrl.text = widget.initialAmount!.toStringAsFixed(2);
    }
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final refData = ref.watch(referenceDataProvider);
    final channels = refData.value?.paymentChannels ?? const [];

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
            Text('Sale Entry', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            DropdownButtonFormField<int>(
              initialValue: _channelId,
              decoration: const InputDecoration(labelText: 'Payment Channel'),
              items: channels
                  .map((c) => DropdownMenuItem(value: c.id, child: Text(c.name)))
                  .toList(),
              onChanged: (v) => setState(() => _channelId = v),
              validator: (v) => v == null ? 'Select a channel' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              validator: (v) {
                final n = double.tryParse(v ?? '');
                if (n == null || n <= 0) {
                  return 'Enter a valid amount';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop((
                    channelId: _channelId!,
                    amount: double.parse(_amountCtrl.text),
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
