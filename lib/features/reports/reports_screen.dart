import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/money.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_controller.dart';
import 'reports_controller.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  String _fmt(String iso) {
    try {
      final d = DateTime.parse(iso);
      const m = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
      return '${d.day} ${m[d.month - 1]} ${d.year}';
    } catch (_) {
      return iso;
    }
  }

  String _shift(String iso, int days) {
    try {
      final d = DateTime.parse(iso).add(Duration(days: days));
      return '${d.year.toString().padLeft(4, '0')}-'
          '${d.month.toString().padLeft(2, '0')}-'
          '${d.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }

  bool _isToday(String iso) {
    final now = DateTime.now();
    return iso ==
        '${now.year.toString().padLeft(4, '0')}-'
            '${now.month.toString().padLeft(2, '0')}-'
            '${now.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol = ref.watch(authControllerProvider).value?.company.currencySymbol ?? '₹';
    final selectedDate = ref.watch(reportSelectedDateProvider);
    final summary = ref.watch(reportsSummaryProvider);
    final channels = ref.watch(reportsChannelsProvider);
    final expenses = ref.watch(reportsExpensesProvider);
    final counters = ref.watch(reportsCountersProvider);
    final canGoForward = !_isToday(selectedDate);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('Reports')),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(reportsSummaryProvider);
          ref.invalidate(reportsChannelsProvider);
          ref.invalidate(reportsExpensesProvider);
          ref.invalidate(reportsCountersProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _DateNav(
              label: _fmt(selectedDate),
              onBack: () => ref
                  .read(reportSelectedDateProvider.notifier)
                  .select(_shift(selectedDate, -1)),
              onForward: canGoForward
                  ? () => ref
                      .read(reportSelectedDateProvider.notifier)
                      .select(_shift(selectedDate, 1))
                  : null,
              onPickDate: () async {
                final parsed = DateTime.tryParse(selectedDate) ?? DateTime.now();
                final picked = await showDatePicker(
                  context: context,
                  initialDate: parsed,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null && context.mounted) {
                  final iso = '${picked.year.toString().padLeft(4, '0')}-'
                      '${picked.month.toString().padLeft(2, '0')}-'
                      '${picked.day.toString().padLeft(2, '0')}';
                  ref.read(reportSelectedDateProvider.notifier).select(iso);
                }
              },
            ),
            const SizedBox(height: 8),

            // ── Summary ──────────────────────────────────────────────────
            _Section(
              title: 'Summary',
              child: summary.when(
                loading: () => const _Loading(),
                error: (_, _) => const _Err(),
                data: (s) => Column(children: [
                  _Row(label: 'Total sales', value: formatMoney(s.totalSales, symbol)),
                  _Row(label: 'Cash in hand', value: formatMoney(s.cashInHand, symbol)),
                  _Row(label: 'Expenses', value: formatMoney(s.totalExpenses, symbol)),
                  _Row(
                      label: 'Net position',
                      value: formatMoney(s.netPosition, symbol),
                      green: true),
                  _Row(label: 'Closings finalized', value: '${s.finalizedClosings}'),
                ]),
              ),
            ),

            // ── Sales by Channel ─────────────────────────────────────────
            _Section(
              title: 'Sales by Channel',
              child: channels.when(
                loading: () => const _Loading(),
                error: (_, _) => const _Err(),
                data: (list) => list.isEmpty
                    ? const _Empty('No sales recorded')
                    : Column(
                        children: list
                            .map((c) => _Row(
                                  label: c.channel,
                                  sublabel: c.type,
                                  value: formatMoney(c.total, symbol),
                                ))
                            .toList(),
                      ),
              ),
            ),

            // ── Counter Transactions ──────────────────────────────────────
            _Section(
              title: 'Counter Transactions',
              child: counters.when(
                loading: () => const _Loading(),
                error: (_, _) => const _Err(),
                data: (list) => list.isEmpty
                    ? const _Empty('No counter transactions')
                    : Column(
                        children: list
                            .map((c) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 6, 0, 2),
                                      child: Text(c.counter,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.navy,
                                              fontSize: 13)),
                                    ),
                                    _Row(
                                        label: 'Sale amount',
                                        value: formatMoney(c.saleAmount, symbol)),
                                    _Row(
                                        label: 'Paid amount',
                                        value: formatMoney(c.paidAmount, symbol)),
                                    _Row(
                                        label: 'Balance',
                                        value: formatMoney(c.balance, symbol),
                                        green: c.balance == 0),
                                    const Divider(height: 16),
                                  ],
                                ))
                            .toList(),
                      ),
              ),
            ),

            // ── Expenses by Category ──────────────────────────────────────
            _Section(
              title: 'Expenses by Category',
              child: expenses.when(
                loading: () => const _Loading(),
                error: (_, _) => const _Err(),
                data: (list) => list.isEmpty
                    ? const _Empty('No expenses recorded')
                    : Column(
                        children: list
                            .map((e) => _Row(
                                  label: e.category,
                                  sublabel: '${e.count} item${e.count == 1 ? '' : 's'}',
                                  value: formatMoney(e.total, symbol),
                                ))
                            .toList(),
                      ),
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ── Shared widgets ────────────────────────────────────────────────────────────

class _DateNav extends StatelessWidget {
  const _DateNav({
    required this.label,
    required this.onBack,
    required this.onForward,
    required this.onPickDate,
  });

  final String label;
  final VoidCallback onBack;
  final VoidCallback? onForward;
  final VoidCallback onPickDate;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        icon: const Icon(Icons.chevron_left_rounded),
        onPressed: onBack,
        color: AppColors.navy,
      ),
      Expanded(
        child: InkWell(
          onTap: onPickDate,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(label,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.navy)),
              const SizedBox(width: 6),
              const Icon(Icons.calendar_today, size: 16, color: AppColors.slate),
            ]),
          ),
        ),
      ),
      IconButton(
        icon: const Icon(Icons.chevron_right_rounded),
        onPressed: onForward,
        color: onForward != null ? AppColors.navy : AppColors.slate,
      ),
    ]);
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: AppColors.slate,
                letterSpacing: 0.4)),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2)),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: child,
        ),
      ]),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.label, required this.value, this.sublabel, this.green = false});
  final String label;
  final String? sublabel;
  final String value;
  final bool green;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: const TextStyle(fontSize: 14, color: AppColors.navy)),
            if (sublabel != null)
              Text(sublabel!,
                  style: const TextStyle(fontSize: 11, color: AppColors.slate)),
          ]),
        ),
        Text(value,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: green ? AppColors.green : AppColors.navy)),
      ]),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();
  @override
  Widget build(BuildContext context) => const Padding(
      padding: EdgeInsets.all(12), child: Center(child: CircularProgressIndicator()));
}

class _Err extends StatelessWidget {
  const _Err();
  @override
  Widget build(BuildContext context) =>
      const Padding(padding: EdgeInsets.all(8), child: Text('Could not load. Pull to refresh.'));
}

class _Empty extends StatelessWidget {
  const _Empty(this.message);
  final String message;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child:
          Text(message, style: const TextStyle(color: AppColors.slate, fontSize: 13)));
}
