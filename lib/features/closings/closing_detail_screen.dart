import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/error/app_exception.dart';
import '../../core/money.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/daily_closing.dart';
import '../auth/auth_controller.dart';
import '../dashboard/dashboard_controller.dart';
import 'closing_detail_controller.dart';
import 'closings_list_controller.dart';

class ClosingDetailScreen extends ConsumerWidget {
  const ClosingDetailScreen({super.key, required this.closingId});
  final int closingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol =
        ref.watch(authControllerProvider).value?.company.currencySymbol ?? '₹';
    final async = ref.watch(closingDetailControllerProvider(closingId));

    return Scaffold(
      appBar: AppBar(title: const Text('Closing')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(
            child: Text(e is AppException ? e.message : 'Could not load')),
        data: (c) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(c.date,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w800)),
            Text(c.branch?.name ?? '',
                style: const TextStyle(color: AppColors.slate)),
            const SizedBox(height: 16),
            _totals(c, symbol),
            const SizedBox(height: 16),
            _section('Sales', [
              for (final s in c.sales)
                _row(s.paymentChannel?.name ?? 'Sale',
                    formatMoney(s.amount, symbol)),
            ]),
            _section('Expenses', [
              for (final e in c.expenses)
                _row(
                    '${e.category?.name ?? 'Expense'} — ${e.description}',
                    formatMoney(e.amount, symbol)),
            ]),
            if (c.deductions.isNotEmpty)
              _section('Deductions', [
                for (final d in c.deductions)
                  _row(d.description ?? d.type,
                      formatMoney(d.amount, symbol)),
              ]),
            if (c.counterTransactions.isNotEmpty)
              _section('Counters', [
                for (final t in c.counterTransactions)
                  _row(
                      t.counter?.name ?? 'Counter',
                      '${formatMoney(t.paidAmount, symbol)} / '
                          '${formatMoney(t.saleAmount, symbol)}'),
              ]),
            const SizedBox(height: 24),
            if (!c.statusIsFinalized)
              FilledButton.icon(
                onPressed: () => _confirmFinalize(context, ref),
                icon: const Icon(Icons.lock_outline),
                label: const Text('Finalize day'),
              )
            else
              const Center(
                  child: Text('This day is closed',
                      style: TextStyle(color: AppColors.slate))),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmFinalize(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Finalize this day?'),
        content: const Text("After finalizing you can't make changes."),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Finalize')),
        ],
      ),
    );
    if (ok != true) {
      return;
    }
    try {
      await ref
          .read(closingDetailControllerProvider(closingId).notifier)
          .finalize();
      // Refresh the list badge and the dashboard "not closed" nudge.
      ref.invalidate(closingsListControllerProvider);
      ref.invalidate(dashboardControllerProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Day finalized'),
            backgroundColor: AppColors.green));
      }
    } on AppException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    }
  }

  Widget _totals(DailyClosing c, String symbol) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            _row('Total sales', formatMoney(c.totalSales, symbol), bold: true),
            _row('Expenses', formatMoney(c.totalExpenses, symbol)),
            _row('Deductions', formatMoney(c.totalDeductions, symbol)),
            const Divider(),
            _row('Cash in hand', formatMoney(c.cashInHand, symbol),
                bold: true),
            _row('Net position', formatMoney(c.netPosition, symbol),
                bold: true),
          ]),
        ),
      );

  Widget _section(String title, List<Widget> rows) => Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.w800)),
          ),
          if (rows.isEmpty)
            const Text('None', style: TextStyle(color: AppColors.slate))
          else
            ...rows,
        ]),
      );

  Widget _row(String label, String value, {bool bold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(label,
                      style: TextStyle(
                          fontWeight:
                              bold ? FontWeight.w700 : FontWeight.w400))),
              Text(value,
                  style: TextStyle(
                      fontWeight:
                          bold ? FontWeight.w700 : FontWeight.w400)),
            ]),
      );
}
