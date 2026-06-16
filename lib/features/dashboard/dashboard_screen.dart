import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/config/flavor_config.dart';
import '../../core/money.dart';
import '../../data/models/report_summary.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_controller.dart';
import 'dashboard_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider).value;
    final symbol = user?.company.currencySymbol ?? '₹';
    final summaryAsync = ref.watch(dashboardControllerProvider);
    final isClosedToday = summaryAsync.value?.finalizedClosings != null &&
        summaryAsync.value!.finalizedClosings > 0;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: RefreshIndicator(
        onRefresh: () => ref.read(dashboardControllerProvider.notifier).refresh(),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _Header(name: user?.name ?? '', symbol: symbol, summaryAsync: summaryAsync),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: _ClosingCta(
                isClosedToday: isClosedToday,
                onTap: () => context.push('/closing'),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(children: [
                Expanded(
                  child: _SecondaryCard(
                    icon: Icons.receipt_long_rounded,
                    iconBg: const Color(0xFFE8EFFB),
                    title: 'History',
                    hint: 'Past closings',
                    onTap: () => context.go('/closings'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SecondaryCard(
                    icon: Icons.bar_chart_rounded,
                    iconBg: const Color(0xFFEFEAFB),
                    title: 'Reports',
                    hint: 'Trends & insights',
                    onTap: () => context.go('/reports'),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 24),
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
    final primary = Theme.of(context).colorScheme.primary;
    final primaryDark = Color.alphaBlend(Colors.black.withValues(alpha: 0.25), primary);
    final flavor = FlavorConfig.instance;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [primary, primaryDark],
        ),
      ),
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(flavor.iconAsset, height: 28, width: 28, fit: BoxFit.cover),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      flavor.appName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none, color: Colors.white, size: 26),
                  onPressed: null,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Hello, $name',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.85),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 14),
            summaryAsync.when(
              loading: () => const _HeroCardSkeleton(),
              error: (e, _) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Could not load. Pull to refresh.', style: TextStyle(color: Colors.white70)),
              ),
              data: (s) => _HeroCard(s: s, symbol: symbol),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroCardSkeleton extends StatelessWidget {
  const _HeroCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: const Center(child: CircularProgressIndicator(color: Colors.white54, strokeWidth: 2)),
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
          Text("Today's Sales", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.65), fontSize: 12)),
          Text(
            formatMoney(s.totalSales, symbol),
            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
          ),
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

  Widget _divider() => Container(
      width: 1, height: 28, color: Colors.white24,
      margin: const EdgeInsets.symmetric(horizontal: 12));

  Widget _stat(String label, String value, {bool green = false}) => Expanded(
        child: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.6),
                  fontSize: 10.5,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: green
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.onPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
}

class _ClosingCta extends StatelessWidget {
  const _ClosingCta({required this.isClosedToday, required this.onTap});
  final bool isClosedToday;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final primaryDark = Color.alphaBlend(Colors.black.withValues(alpha: 0.25), primary);
    final gradient = isClosedToday
        ? const LinearGradient(
            colors: [Color(0xFF16A34A), Color(0xFF15803D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : LinearGradient(
            colors: [primary, primaryDark],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );
    final shadowColor = isClosedToday
        ? const Color(0xFF22C55E).withValues(alpha: 0.30)
        : primary.withValues(alpha: 0.30);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [BoxShadow(color: shadowColor, blurRadius: 14, offset: const Offset(0, 5))],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Row(children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isClosedToday ? Icons.check_circle_outline_rounded : Icons.event_available_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    isClosedToday ? "Today's Closing" : 'Daily Closing',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    isClosedToday ? 'Closed · tap to review' : 'Not closed yet · tap to open',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.75), fontSize: 13),
                  ),
                ]),
              ),
              Icon(Icons.chevron_right_rounded, color: Colors.white.withValues(alpha: 0.70)),
            ]),
          ),
        ),
      ),
    );
  }
}

class _SecondaryCard extends StatelessWidget {
  const _SecondaryCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.hint,
    required this.onTap,
  });
  final IconData icon;
  final Color iconBg;
  final String title;
  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2)),
            ],
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: iconBg, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: AppColors.navy, size: 22),
            ),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.navy)),
            Text(hint, style: const TextStyle(fontSize: 12, color: AppColors.slate)),
          ]),
        ),
      ),
    );
  }
}
