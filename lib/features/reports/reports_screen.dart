import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/money.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_controller.dart';
import 'reports_controller.dart';

class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol = ref.watch(authControllerProvider).value?.company.currencySymbol ?? '₹';
    final summary = ref.watch(reportsSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(reportsSummaryProvider),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Today', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 12),
            summary.when(
              loading: () => const Center(
                  child: Padding(
                      padding: EdgeInsets.all(24), child: CircularProgressIndicator())),
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
