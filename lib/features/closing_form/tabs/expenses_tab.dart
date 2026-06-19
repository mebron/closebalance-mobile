import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../core/providers.dart';
import '../../../data/sync/closing_math.dart';
import '../closing_form_controller.dart';
import '../sheets/deduction_sheet.dart';
import '../sheets/expense_sheet.dart';
import '../widgets/line_card.dart';

class ExpensesTab extends ConsumerStatefulWidget {
  const ExpensesTab({super.key, required this.arg, required this.currencySymbol});

  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  ConsumerState<ExpensesTab> createState() => _ExpensesTabState();
}

class _ExpensesTabState extends ConsumerState<ExpensesTab> {
  bool _addingExpense = false;
  bool _addingDeduction = false;

  Future<void> _addExpense(BuildContext context) async {
    if (_addingExpense) return;
    setState(() => _addingExpense = true);
    try {
      final result = await showExpenseSheet(context);
      if (result != null && mounted) {
        await ref
            .read(closingFormControllerProvider(widget.arg).notifier)
            .addExpense(
              expenseCategoryId: result.categoryId,
              description: result.description,
              amount: result.amount,
              paymentMethod: result.paymentMethod,
            );
      }
    } finally {
      if (mounted) setState(() => _addingExpense = false);
    }
  }

  Future<void> _addDeduction(BuildContext context) async {
    if (_addingDeduction) return;
    setState(() => _addingDeduction = true);
    try {
      final result = await showDeductionSheet(context);
      if (result != null && mounted) {
        await ref
            .read(closingFormControllerProvider(widget.arg).notifier)
            .addDeduction(
              type: result.type,
              description: result.description,
              amount: result.amount,
              paymentMethod: result.paymentMethod,
            );
      }
    } finally {
      if (mounted) setState(() => _addingDeduction = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final closing = ref.watch(closingFormControllerProvider(widget.arg)).value;
    if (closing == null) {
      return const SizedBox.shrink();
    }
    final ctrl = ref.read(closingFormControllerProvider(widget.arg).notifier);
    final isFinalized = closing.status.isFinalized;
    final refData = ref.watch(referenceDataProvider);
    final categoryNames = {
      for (final c in refData.value?.expenseCategories ?? const []) c.id: c.name,
    };

    return ListView(
      children: [
        // === Expenses section ===
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text('Expenses', style: Theme.of(context).textTheme.titleMedium),
              ),
              Text('Total: ${formatMoney(ClosingMath.totalExpenses(closing), widget.currencySymbol)}'),
            ],
          ),
        ),
        ...closing.expenses.where((e) => !e.deleted).map(
              (e) => LineCard(
                title: categoryNames[e.expenseCategoryId] ?? e.description ?? 'Expense',
                subtitle: e.description,
                amount: formatMoney(e.amount, widget.currencySymbol),
                onTap: isFinalized
                    ? null
                    : () async {
                        final result = await showExpenseSheet(
                          context,
                          initialCategoryId: e.expenseCategoryId,
                          initialDescription: e.description,
                          initialAmount: e.amount,
                          initialPaymentMethod: e.paymentMethod,
                        );
                        if (result != null && mounted) {
                          await ctrl.updateExpense(
                            clientId: e.clientId,
                            expenseCategoryId: result.categoryId,
                            description: result.description,
                            amount: result.amount,
                            paymentMethod: result.paymentMethod,
                          );
                        }
                      },
                onDelete: isFinalized ? null : () => ctrl.deleteExpense(e.clientId),
              ),
            ),
        if (!isFinalized)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add expense'),
              onPressed: _addingExpense ? null : () => _addExpense(context),
            ),
          ),
        const Divider(height: 24),
        // === Deductions section ===
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Row(
            children: [
              Expanded(
                child: Text('Deductions', style: Theme.of(context).textTheme.titleMedium),
              ),
              Text('Total: ${formatMoney(ClosingMath.totalDeductions(closing), widget.currencySymbol)}'),
            ],
          ),
        ),
        ...closing.deductions.where((d) => !d.deleted).map(
              (d) => LineCard(
                title: d.description ?? d.type,
                subtitle: d.paymentMethod,
                amount: formatMoney(d.amount, widget.currencySymbol),
                onTap: isFinalized
                    ? null
                    : () async {
                        final result = await showDeductionSheet(
                          context,
                          initialType: d.type,
                          initialDescription: d.description,
                          initialAmount: d.amount,
                          initialPaymentMethod: d.paymentMethod,
                        );
                        if (result != null && mounted) {
                          await ctrl.updateDeduction(
                            clientId: d.clientId,
                            type: result.type,
                            description: result.description,
                            amount: result.amount,
                            paymentMethod: result.paymentMethod,
                          );
                        }
                      },
                onDelete: isFinalized ? null : () => ctrl.deleteDeduction(d.clientId),
              ),
            ),
        if (!isFinalized)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add deduction'),
              onPressed: _addingDeduction ? null : () => _addDeduction(context),
            ),
          ),
      ],
    );
  }
}
