import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';
import '../../../data/sync/closing_math.dart';
import '../closing_form_controller.dart';
import '../sheets/counter_sheet.dart';
import '../widgets/line_card.dart';

class CountersTab extends ConsumerStatefulWidget {
  const CountersTab({super.key, required this.arg, required this.currencySymbol});

  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  ConsumerState<CountersTab> createState() => _CountersTabState();
}

class _CountersTabState extends ConsumerState<CountersTab> {
  bool _adding = false;

  Future<void> _addCounter(BuildContext context) async {
    if (_adding) return;
    setState(() => _adding = true);
    try {
      final result = await showCounterSheet(context);
      if (result != null && mounted) {
        await ref
            .read(closingFormControllerProvider(widget.arg).notifier)
            .addCounterTxn(
              counterId: result.counterId,
              saleAmount: result.saleAmount,
              payments: result.payments,
              remarks: result.remarks,
            );
      }
    } finally {
      if (mounted) setState(() => _adding = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final closing = ref.watch(closingFormControllerProvider(widget.arg)).value;
    if (closing == null) {
      return const SizedBox.shrink();
    }
    final ctrl = ref.read(closingFormControllerProvider(widget.arg).notifier);
    final isFinalized = closing.status.isFinalized;
    final refData = ref.watch(referenceDataProvider);
    final counterNames = {
      for (final c in refData.value?.counters ?? const []) c.id: c.name
    };

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Counter Transactions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text('Paid: ${formatMoney(ClosingMath.counterPaid(closing), widget.currencySymbol)}'),
            ],
          ),
        ),
        ...closing.counterTransactions.where((t) => !t.deleted).map(
              (t) => LineCard(
                title: counterNames[t.counterId] ?? 'Counter ${t.counterId}',
                subtitle:
                    'Sale: ${formatMoney(t.saleAmount, widget.currencySymbol)} · Paid: ${formatMoney(t.paidAmount, widget.currencySymbol)}',
                amount: formatMoney(t.saleAmount - t.paidAmount, widget.currencySymbol),
                onTap: isFinalized
                    ? null
                    : () async {
                        final result = await showCounterSheet(
                          context,
                          initialCounterId: t.counterId,
                          initialSaleAmount: t.saleAmount,
                          initialPayments: t.payments,
                          initialRemarks: t.remarks,
                        );
                        if (result != null && mounted) {
                          await ctrl.updateCounterTxn(
                            clientId: t.clientId,
                            counterId: result.counterId,
                            saleAmount: result.saleAmount,
                            payments: result.payments,
                            remarks: result.remarks,
                          );
                        }
                      },
                onDelete: isFinalized ? null : () => ctrl.deleteCounterTxn(t.clientId),
              ),
            ),
        if (!isFinalized)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add counter'),
              onPressed: _adding ? null : () => _addCounter(context),
            ),
          ),
      ],
    );
  }
}
