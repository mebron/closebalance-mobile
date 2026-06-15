import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';
import 'closing_form_controller.dart';
import 'tabs/channels_tab.dart';
import 'tabs/counters_tab.dart';
import 'tabs/details_tab.dart';
import 'tabs/expenses_tab.dart';
import 'widgets/summary_footer.dart';

class DailyClosingFormScreen extends ConsumerStatefulWidget {
  const DailyClosingFormScreen({super.key, required this.arg});

  final ClosingFormArg arg;

  @override
  ConsumerState<DailyClosingFormScreen> createState() => _State();
}

class _State extends ConsumerState<DailyClosingFormScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    try {
      await ref.read(closingFormControllerProvider(widget.arg).notifier).save();
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Saved')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(closingFormControllerProvider(widget.arg));
    final closing = state.value;

    final refData = ref.watch(referenceDataProvider);
    final currencySymbol = refData.value?.currencySymbol ?? '';
    final channels = refData.value?.paymentChannels ?? const [];
    final channelTypes = {for (final c in channels) c.id: c.type};

    final branchName = refData.value?.branches
            .where((b) => closing != null && b.id == closing.branchId)
            .firstOrNull
            ?.name ??
        '';

    final isFinalized = closing?.status.isFinalized ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Closing · ${closing?.date ?? ''}'),
        flexibleSpace: Container(decoration: const BoxDecoration(gradient: AppColors.headerGradient)),
        actions: [
          if (!isFinalized)
            TextButton(
              onPressed: _save,
              child: const Text('Save', style: TextStyle(color: Colors.white)),
            ),
        ],
        bottom: TabBar(
          controller: _tabs,
          labelColor: Colors.white,
          indicatorColor: AppColors.green,
          tabs: const [
            Tab(text: 'Details'),
            Tab(text: 'Channels'),
            Tab(text: 'Expenses'),
            Tab(text: 'Counters'),
          ],
        ),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (c) => Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabs,
                children: [
                  DetailsTab(closing: c, arg: widget.arg, branchName: branchName),
                  ChannelsTab(arg: widget.arg, currencySymbol: currencySymbol),
                  ExpensesTab(arg: widget.arg, currencySymbol: currencySymbol),
                  CountersTab(arg: widget.arg, currencySymbol: currencySymbol),
                ],
              ),
            ),
            SummaryFooter(
              closing: c,
              currencySymbol: currencySymbol,
              channelTypes: channelTypes,
            ),
          ],
        ),
      ),
    );
  }
}
