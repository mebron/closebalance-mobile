import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/error/app_exception.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/expense_category.dart';
import '../dashboard/dashboard_controller.dart';
import 'quick_expense_controller.dart';

final _categoriesProvider = FutureProvider.autoDispose<List<ExpenseCategory>>((ref) async {
  final cached = await ref.read(referenceRepositoryProvider).cached();
  return cached?.expenseCategories ?? const [];
});

class QuickExpenseScreen extends ConsumerStatefulWidget {
  const QuickExpenseScreen({super.key});

  @override
  ConsumerState<QuickExpenseScreen> createState() => _QuickExpenseScreenState();
}

class _QuickExpenseScreenState extends ConsumerState<QuickExpenseScreen> {
  final _amount = TextEditingController();
  final _description = TextEditingController();
  int? _categoryId;
  String _method = 'cash';
  String? _error;
  bool _submitting = false;

  @override
  void dispose() {
    _amount.dispose();
    _description.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final amount = num.tryParse(_amount.text.trim());
    if (amount == null || amount <= 0) {
      setState(() => _error = 'Enter an amount');
      return;
    }
    if (_categoryId == null) {
      setState(() => _error = 'Choose a category');
      return;
    }
    if (_description.text.trim().isEmpty) {
      setState(() => _error = 'Add a short note');
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    try {
      await ref.read(quickExpenseControllerProvider.notifier).submit(
            expenseCategoryId: _categoryId!,
            description: _description.text.trim(),
            amount: amount,
            paymentMethod: _method,
          );
      ref.invalidate(dashboardControllerProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Expense saved — syncs automatically'), backgroundColor: AppColors.green));
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
    final categories = ref.watch(_categoriesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: SingleChildScrollView(
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
            const SizedBox(height: 16),
            const Text('Category', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            categories.when(
              loading: () => const CircularProgressIndicator(),
              error: (e, st) => const Text('Could not load categories'),
              data: (cats) => DropdownButtonFormField<int>(
                initialValue: _categoryId,
                items: cats.map((c) => DropdownMenuItem(value: c.id, child: Text(c.name))).toList(),
                onChanged: (v) => setState(() => _categoryId = v),
                decoration: const InputDecoration(hintText: 'Choose a category'),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Note', style: TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            TextField(
                controller: _description,
                decoration: const InputDecoration(hintText: 'What was it for?')),
            const SizedBox(height: 16),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'cash', label: Text('Cash')),
                ButtonSegment(value: 'bank', label: Text('Bank')),
              ],
              selected: {_method},
              onSelectionChanged: (s) => setState(() => _method = s.first),
            ),
            if (_error != null) ...[
              const SizedBox(height: 12),
              Text(_error!, style: const TextStyle(color: AppColors.danger)),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _submitting ? null : _save,
              child: _submitting
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  : const Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
