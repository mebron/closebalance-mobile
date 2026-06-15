import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/money.dart';
import '../../data/models/report_summary.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_controller.dart';
import 'dashboard_controller.dart';
import 'widgets/quick_action_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;
    final symbol = user?.company.currencySymbol ?? '₹';
    final summaryAsync = ref.watch(dashboardControllerProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.read(dashboardControllerProvider.notifier).refresh(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _Header(name: user?.name ?? '', symbol: symbol, summaryAsync: summaryAsync),
            Padding(
              padding: const EdgeInsets.all(18),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.5,
                children: [
                  QuickActionCard(icon: Icons.add, iconBg: const Color(0xFFE7F9EE),
                      title: 'Add Sale', hint: 'Record money in',
                      onTap: () => context.push('/sale')),
                  QuickActionCard(icon: Icons.remove, iconBg: const Color(0xFFFDEAEA),
                      title: 'Add Expense', hint: 'Record money out',
                      onTap: () => context.push('/expense')),
                  QuickActionCard(icon: Icons.event_available, iconBg: const Color(0xFFE8EFFB),
                      title: 'Daily Closing', hint: 'Close the day',
                      onTap: () => context.go('/closings')),
                  QuickActionCard(icon: Icons.bar_chart, iconBg: const Color(0xFFEFEAFB),
                      title: 'Reports', hint: 'See trends',
                      onTap: () => context.go('/reports')),
                ],
              ),
            ),
            summaryAsync.maybeWhen(
              data: (s) => s.finalizedClosings == 0
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: _NudgeCard(onTap: () => context.go('/closings')))
                  : const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.name, required this.symbol, required this.summaryAsync});
  final String name;
  final String symbol;
  final AsyncValue<ReportSummary> summaryAsync;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppColors.headerGradient),
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 22),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo-mobile-light.png', height: 28),
                const Icon(Icons.notifications_none, color: Colors.white),
              ],
            ),
            const SizedBox(height: 8),
            Text('Hello, $name', style: const TextStyle(color: Color(0xFF90D981), fontSize: 13)),
            const SizedBox(height: 12),
            summaryAsync.when(
              loading: () => const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator(color: Colors.white))),
              error: (e, _) => const Text('Could not load. Pull to refresh.',
                  style: TextStyle(color: Colors.white70)),
              data: (s) => _HeroCard(s: s, symbol: symbol),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.s, required this.symbol});
  final ReportSummary s;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Today's Sales", style: TextStyle(color: Color(0xFFBCD4EC), fontSize: 12)),
          Text(formatMoney(s.totalSales, symbol),
              style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800)),
          const SizedBox(height: 10),
          Row(children: [
            _stat('Cash in hand', formatMoney(s.cashInHand, symbol)),
            _divider(),
            _stat('Expenses', formatMoney(s.totalExpenses, symbol)),
            _divider(),
            _stat('Net', formatMoney(s.netPosition, symbol), green: true),
          ]),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 28, color: Colors.white24,
      margin: const EdgeInsets.symmetric(horizontal: 12));

  Widget _stat(String label, String value, {bool green = false}) => Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: const TextStyle(color: Color(0xFF8FB0D4), fontSize: 10.5)),
          Text(value, style: TextStyle(
              color: green ? const Color(0xFF90D981) : Colors.white,
              fontSize: 14, fontWeight: FontWeight.w700)),
        ]),
      );
}

class _NudgeCard extends StatelessWidget {
  const _NudgeCard({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Row(children: [
          Container(width: 38, height: 38,
              decoration: BoxDecoration(color: const Color(0xFFFFF4E0), borderRadius: BorderRadius.circular(11)),
              child: const Icon(Icons.access_time, color: Color(0xFFE0A23E))),
          const SizedBox(width: 12),
          const Expanded(child: Text('Today is not closed yet',
              style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.navy))),
          const Icon(Icons.chevron_right, color: AppColors.green),
        ]),
      ),
    );
  }
}
