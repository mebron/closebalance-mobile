import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/money.dart';
import '../../core/theme/app_colors.dart';
import '../auth/auth_controller.dart';
import 'closings_list_controller.dart';

class ClosingsListScreen extends ConsumerWidget {
  const ClosingsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final symbol = ref.watch(authControllerProvider).value?.company.currencySymbol ?? '₹';
    final async = ref.watch(closingsListControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Closings')),
      body: RefreshIndicator(
        onRefresh: () => ref.read(closingsListControllerProvider.notifier).refresh(),
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, st) => ListView(children: const [
            SizedBox(height: 120),
            Center(child: Text('Could not load. Pull to refresh.')),
          ]),
          data: (items) => items.isEmpty
              ? ListView(children: const [
                  SizedBox(height: 120),
                  Center(child: Text('No closings yet')),
                ])
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (_, i) {
                    final c = items[i];
                    final finalized = c.statusIsFinalized;
                    return Card(
                      child: ListTile(
                        onTap: () => context.push('/closing/${c.id}', extra: (branchId: c.branch?.id ?? 0, date: c.date)),
                        title: Text(c.date,
                            style: const TextStyle(fontWeight: FontWeight.w700)),
                        subtitle: Text(c.branch?.name ?? ''),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(formatMoney(c.totalSales, symbol),
                                style:
                                    const TextStyle(fontWeight: FontWeight.w700)),
                            Text(finalized ? 'Closed' : 'Open',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: finalized
                                        ? AppColors.slate
                                        : AppColors.green)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
