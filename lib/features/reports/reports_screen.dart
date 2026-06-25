import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/error/app_exception.dart';
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
    final report = ref.watch(dayReportProvider);
    final canGoForward = !_isToday(selectedDate);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('Reports')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(dayReportProvider),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Date nav is always visible
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

            // ── Summary ────────────────────────────────────────────────
            _Section(
              title: 'Summary',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => Column(children: [
                  _Row(label: 'Total sales', value: formatMoney(r.totalSales, symbol)),
                  _Row(label: 'Cash in hand', value: formatMoney(r.cashInHand, symbol)),
                  _Row(label: 'Expenses', value: formatMoney(r.totalExpenses, symbol)),
                  _Row(label: 'Deductions', value: formatMoney(r.totalDeductions, symbol)),
                  _Row(
                      label: 'Net Profit',
                      value: formatMoney(r.netProfit, symbol),
                      green: true),
                  _Row(label: 'Closings finalized', value: '${r.finalizedClosings}'),
                ]),
              ),
            ),

            // ── Cash Flow ──────────────────────────────────────────────
            _Section(
              title: 'Cash Flow',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => Column(children: [
                  _CashFlowRow(label: 'Cash collected', value: r.cashCollections, symbol: symbol),
                  if (r.totalCounterPaid != 0)
                    _CashFlowRow(label: 'Counter paid', value: -r.totalCounterPaid, symbol: symbol),
                  if (r.cashExpenses != 0)
                    _CashFlowRow(label: 'Cash expenses', value: -r.cashExpenses, symbol: symbol),
                  if (r.cashDeductions != 0)
                    _CashFlowRow(label: 'Cash deductions', value: -r.cashDeductions, symbol: symbol),
                  const Divider(height: 20, thickness: 0.5),
                  _CashFlowRow(
                    label: 'Cash in hand',
                    value: r.cashInHand,
                    symbol: symbol,
                    isTotalRow: true,
                  ),
                ]),
              ),
            ),

            // ── Sales by Channel ───────────────────────────────────────
            _Section(
              title: 'Sales by Channel',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => r.channels.isEmpty
                    ? const _Empty('No channel sales recorded')
                    : Column(
                        children: r.channels
                            .map((c) => _Row(
                                  label: c.channel,
                                  sublabel: c.type,
                                  value: formatMoney(c.total, symbol),
                                ))
                            .toList(),
                      ),
              ),
            ),

            // ── Deductions ────────────────────────────────────────────
            _Section(
              title: 'Deductions',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => r.deductions.isEmpty
                    ? const _Empty('No deductions recorded')
                    : Column(
                        children: r.deductions
                            .map((d) => _Row(
                                  label: d.type,
                                  sublabel: '${d.count} item${d.count == 1 ? '' : 's'}',
                                  value: formatMoney(d.total, symbol),
                                ))
                            .toList(),
                      ),
              ),
            ),

            // ── Counter Transactions ───────────────────────────────────
            _Section(
              title: 'Counter Transactions',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => r.counters.isEmpty
                    ? const _Empty('No counter transactions')
                    : Column(
                        children: r.counters
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
                                    _Row(label: 'Sale amount', value: formatMoney(c.saleAmount, symbol)),
                                    _Row(label: 'Paid amount', value: formatMoney(c.paidAmount, symbol)),
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

            // ── Expenses by Category ───────────────────────────────────
            _Section(
              title: 'Expenses by Category',
              child: report.when(
                loading: () => const _Loading(),
                error: (e, _) => _Err(e),
                data: (r) => r.expenses.isEmpty
                    ? const _Empty('No expenses recorded')
                    : Column(
                        children: r.expenses
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
            Text(label, style: const TextStyle(fontSize: 14, color: AppColors.navy)),
            if (sublabel != null)
              Text(sublabel!, style: const TextStyle(fontSize: 11, color: AppColors.slate)),
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
      padding: EdgeInsets.all(12),
      child: Center(child: CircularProgressIndicator(strokeWidth: 2)));
}

class _Err extends StatelessWidget {
  const _Err(this.error);
  final Object error;
  @override
  Widget build(BuildContext context) {
    final msg = error is AppException
        ? (error as AppException).message
        : 'Could not load. Pull to refresh.';
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(msg, style: const TextStyle(color: AppColors.slate, fontSize: 13)),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty(this.message);
  final String message;
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(message, style: const TextStyle(color: AppColors.slate, fontSize: 13)));
}

class _CashFlowRow extends StatelessWidget {
  const _CashFlowRow({
    required this.label,
    required this.value,
    required this.symbol,
    this.isTotalRow = false,
  });

  final String label;
  final double value;
  final String symbol;
  final bool isTotalRow;

  @override
  Widget build(BuildContext context) {
    final isNegative = value < 0;
    final color = isTotalRow
        ? (value >= 0 ? AppColors.green : Colors.red.shade600)
        : (isNegative ? AppColors.slate : AppColors.navy);
    final displayValue = isNegative
        ? '-${formatMoney(-value, symbol)}'
        : formatMoney(value, symbol);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isTotalRow ? AppColors.navy : AppColors.slate,
              fontWeight: isTotalRow ? FontWeight.w700 : FontWeight.normal,
            ),
          ),
        ),
        Text(
          displayValue,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isTotalRow ? FontWeight.w800 : FontWeight.w600,
            color: color,
          ),
        ),
      ]),
    );
  }
}
