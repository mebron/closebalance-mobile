import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/error/app_exception.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';
import '../dashboard/dashboard_controller.dart';
import 'quick_sale_controller.dart';

/// Payment channels from the cached reference data.
final _channelsProvider = FutureProvider.autoDispose((ref) async {
  final cached = await ref.read(referenceRepositoryProvider).cached();
  return cached?.paymentChannels ?? const [];
});

class QuickSaleScreen extends ConsumerStatefulWidget {
  const QuickSaleScreen({super.key});

  @override
  ConsumerState<QuickSaleScreen> createState() => _QuickSaleScreenState();
}

class _QuickSaleScreenState extends ConsumerState<QuickSaleScreen> {
  final _amount = TextEditingController();
  int? _channelId;
  String? _error;
  bool _submitting = false;

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final amount = num.tryParse(_amount.text.trim());
    if (amount == null || amount <= 0) {
      setState(() => _error = 'Enter an amount');
      return;
    }
    if (_channelId == null) {
      setState(() => _error = 'Choose how the money came in');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref
          .read(quickSaleControllerProvider.notifier)
          .submit(paymentChannelId: _channelId!, amount: amount);
      ref.invalidate(dashboardControllerProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sale saved — syncs automatically'), backgroundColor: AppColors.green));
        context.pop();
      }
    } on AppException catch (e) {
      setState(() => _error = e.message);
    } catch (_) {
      setState(() => _error = 'Something went wrong. Please try again.');
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final refData = ref.watch(_channelsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Sale')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Amount', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            TextField(
              controller: _amount,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              decoration: const InputDecoration(hintText: '0'),
            ),
            const SizedBox(height: 20),
            const Text('How did it come in?', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            refData.when(
              loading: () => const CircularProgressIndicator(),
              error: (err, st) => const Text('Could not load payment options'),
              data: (channels) => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: channels
                    .map((ch) => ChoiceChip(
                          label: Text(ch.name),
                          selected: _channelId == ch.id,
                          selectedColor: AppColors.green,
                          labelStyle: TextStyle(
                              color: _channelId == ch.id ? Colors.white : AppColors.navy),
                          onSelected: (_) => setState(() => _channelId = ch.id),
                        ))
                    .toList(),
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: AppColors.danger)),
            ],
            const Spacer(),
            FilledButton(
              onPressed: _submitting ? null : _save,
              child: _submitting
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Save Sale'),
            ),
          ],
        ),
      ),
    );
  }
}
