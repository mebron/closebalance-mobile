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

String _formatDate(String iso) {
  // "2026-06-15" → "15 Jun 2026"
  try {
    final d = DateTime.parse(iso);
    const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  } catch (_) {
    return iso;
  }
}

class _State extends ConsumerState<DailyClosingFormScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs;
  bool _saving = false;

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
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await ref.read(closingFormControllerProvider(widget.arg).notifier).save();
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Saved')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed to save. Check your connection.')));
      }
    } finally {
      if (mounted) setState(() => _saving = false);
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
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Closing',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            if (closing?.date != null)
              Text(
                _formatDate(closing!.date),
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
          ],
        ),
        flexibleSpace: Builder(
          builder: (context) {
            final primary = Theme.of(context).colorScheme.primary;
            final primaryDark = Color.alphaBlend(Colors.black.withValues(alpha: 0.25), primary);
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primary, primaryDark],
                ),
              ),
            );
          },
        ),
        actions: [
          if (!isFinalized)
            TextButton(
              onPressed: _saving ? null : _save,
              child: Text(
                _saving ? 'Saving…' : 'Save',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
        ],
        bottom: TabBar(
          controller: _tabs,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          indicatorWeight: 3,
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
