import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';
import '../../../data/sync/closing_math.dart';
import '../closing_form_controller.dart';
import '../sheets/sale_sheet.dart';
import '../widgets/line_card.dart';

class ChannelsTab extends ConsumerWidget {
  const ChannelsTab({super.key, required this.arg, required this.currencySymbol});

  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closing = ref.watch(closingFormControllerProvider(arg)).value;
    if (closing == null) {
      return const SizedBox.shrink();
    }

    final refData = ref.watch(referenceDataProvider);
    final channels = refData.value?.paymentChannels ?? const [];
    final channelMap = {for (final c in channels) c.id: c};

    final collected = ClosingMath.collected(closing);
    final diff = ClosingMath.difference(closing);
    final isFinalized = closing.status.isFinalized;

    return ListView(
      children: [
        // Reconciliation chips
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Wrap(
            spacing: 8,
            children: [
              Chip(label: Text('Collected: ${formatMoney(collected, currencySymbol)}')),
              Chip(
                label: Text(
                  diff == 0
                      ? 'Balanced'
                      : diff > 0
                          ? 'Short ${formatMoney(diff, currencySymbol)}'
                          : 'Over ${formatMoney(-diff, currencySymbol)}',
                ),
                backgroundColor: diff == 0
                    ? Colors.green[100]
                    : diff > 0
                        ? Colors.orange[100]
                        : Colors.blue[100],
              ),
            ],
          ),
        ),
        // Sale lines
        ...closing.sales.where((s) => !s.deleted).map((s) {
          final channelName =
              channelMap[s.paymentChannelId]?.name ?? 'Channel ${s.paymentChannelId}';
          return LineCard(
            title: channelName,
            amount: formatMoney(s.amount, currencySymbol),
            onTap: isFinalized
                ? null
                : () async {
                    final result = await showSaleSheet(
                      context,
                      initialChannelId: s.paymentChannelId,
                      initialAmount: s.amount,
                    );
                    if (result != null) {
                      await ref
                          .read(closingFormControllerProvider(arg).notifier)
                          .updateSale(
                            clientId: s.clientId,
                            paymentChannelId: result.channelId,
                            amount: result.amount,
                          );
                    }
                  },
            onDelete: isFinalized
                ? null
                : () {
                    ref
                        .read(closingFormControllerProvider(arg).notifier)
                        .deleteSale(s.clientId);
                  },
          );
        }),
        if (!isFinalized)
          Padding(
            padding: const EdgeInsets.all(16),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add channel'),
              onPressed: () async {
                final result = await showSaleSheet(context);
                if (result != null) {
                  await ref
                      .read(closingFormControllerProvider(arg).notifier)
                      .addSale(paymentChannelId: result.channelId, amount: result.amount);
                }
              },
            ),
          ),
      ],
    );
  }
}
