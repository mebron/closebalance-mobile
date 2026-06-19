import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';
import '../../../data/sync/closing_math.dart';
import '../closing_form_controller.dart';
import '../sheets/sale_sheet.dart';
import '../widgets/line_card.dart';

class ChannelsTab extends ConsumerStatefulWidget {
  const ChannelsTab({super.key, required this.arg, required this.currencySymbol});

  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  ConsumerState<ChannelsTab> createState() => _ChannelsTabState();
}

class _ChannelsTabState extends ConsumerState<ChannelsTab> {
  bool _adding = false;

  Future<void> _addSale(BuildContext context) async {
    if (_adding) return;
    setState(() => _adding = true);
    try {
      final result = await showSaleSheet(context);
      if (result != null && mounted) {
        await ref
            .read(closingFormControllerProvider(widget.arg).notifier)
            .addSale(paymentChannelId: result.channelId, amount: result.amount);
      }
    } finally {
      if (mounted) setState(() => _adding = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final closing =
        ref.watch(closingFormControllerProvider(widget.arg)).value;
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Wrap(
            spacing: 8,
            children: [
              Chip(label: Text('Collected: ${formatMoney(collected, widget.currencySymbol)}')),
              Chip(
                label: Text(
                  diff == 0
                      ? 'Balanced'
                      : diff > 0
                          ? 'Short ${formatMoney(diff, widget.currencySymbol)}'
                          : 'Over ${formatMoney(-diff, widget.currencySymbol)}',
                ),
                backgroundColor: diff == 0
                    ? Theme.of(context).colorScheme.secondary.withValues(alpha: 0.15)
                    : diff > 0
                        ? Colors.orange[100]
                        : Colors.blue[100],
                labelStyle: diff == 0
                    ? TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w600,
                      )
                    : null,
              ),
            ],
          ),
        ),
        ...closing.sales.where((s) => !s.deleted).map((s) {
          final channelName =
              channelMap[s.paymentChannelId]?.name ?? 'Channel ${s.paymentChannelId}';
          return LineCard(
            title: channelName,
            amount: formatMoney(s.amount, widget.currencySymbol),
            onTap: isFinalized
                ? null
                : () async {
                    final result = await showSaleSheet(
                      context,
                      initialChannelId: s.paymentChannelId,
                      initialAmount: s.amount,
                    );
                    if (result != null && mounted) {
                      await ref
                          .read(closingFormControllerProvider(widget.arg).notifier)
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
                        .read(closingFormControllerProvider(widget.arg).notifier)
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
              onPressed: _adding ? null : () => _addSale(context),
            ),
          ),
      ],
    );
  }
}
