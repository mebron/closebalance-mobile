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
    return iso == '${now.year.toString().padLeft(4, '0')}-'
        '${now.month.toString().padLeft(2, '0')}-'
        '${now.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol = ref.watch(authControllerProvider).value?.company.currencySymbol ?? '₹';
    final selectedDate = ref.watch(reportSelectedDateProvider);
    final summary = ref.watch(reportsSummaryProvider);
    final canGoForward = !_isToday(selectedDate);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(reportsSummaryProvider),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _DateNav(
              label: _fmt(selectedDate),
              onBack: () => ref.read(reportSelectedDateProvider.notifier).select(
                  _shift(selectedDate, -1)),
              onForward: canGoForward
                  ? () => ref.read(reportSelectedDateProvider.notifier).select(
                      _shift(selectedDate, 1))
                  : null,
              onPickDate: () async {
                final parsed = DateTime.tryParse(selectedDate) ?? DateTime.now();
                final picked = await showDatePicker(
                  context: context,
                  initialDate: parsed,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  final iso = '${picked.year.toString().padLeft(4, '0')}-'
                      '${picked.month.toString().padLeft(2, '0')}-'
                      '${picked.day.toString().padLeft(2, '0')}';
                  ref.read(reportSelectedDateProvider.notifier).select(iso);
                }
              },
            ),
            const SizedBox(height: 12),
            summary.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(child: CircularProgressIndicator())),
              error: (e, st) => const Text('Could not load. Pull to refresh.'),
              data: (s) => Column(children: [
                _tile('Total sales', formatMoney(s.totalSales, symbol)),
                _tile('Cash in hand', formatMoney(s.cashInHand, symbol)),
                _tile('Expenses', formatMoney(s.totalExpenses, symbol)),
                _tile('Net position', formatMoney(s.netPosition, symbol), green: true),
                _tile('Closings finalized', '${s.finalizedClosings}'),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tile(String label, String value, {bool green = false}) => Card(
        child: ListTile(
          title: Text(label),
          trailing: Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: green ? AppColors.green : AppColors.navy),
          ),
        ),
      );
}

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
