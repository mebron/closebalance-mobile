import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/money.dart';
import '../../../data/sync/closing_math.dart';
import '../closing_form_controller.dart';
import '../sheets/deduction_sheet.dart';
import '../sheets/expense_sheet.dart';
import '../widgets/line_card.dart';

class ExpensesTab extends ConsumerWidget {
  const ExpensesTab({super.key, required this.arg, required this.currencySymbol});

  final ClosingFormArg arg;
  final String currencySymbol;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final closing = ref.watch(closingFormControllerProvider(arg)).value;
    if (closing == null) {
      return const SizedBox.shrink();
    }
    final ctrl = ref.read(closingFormControllerProvider(arg).notifier);
    final isFinalized = closing.status.isFinalized;

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
              Text('Total: ${formatMoney(ClosingMath.totalExpenses(closing), currencySymbol)}'),
            ],
          ),
        ),
        ...closing.expenses.where((e) => !e.deleted).map(
              (e) => LineCard(
                title: e.description ?? 'Expense',
                subtitle: e.paymentMethod,
                amount: formatMoney(e.amount, currencySymbol),
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
                        if (result != null) {
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
              onPressed: () async {
                final result = await showExpenseSheet(context);
                if (result != null) {
                  await ctrl.addExpense(
                    expenseCategoryId: result.categoryId,
                    description: result.description,
                    amount: result.amount,
                    paymentMethod: result.paymentMethod,
                  );
                }
              },
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
              Text('Total: ${formatMoney(ClosingMath.totalDeductions(closing), currencySymbol)}'),
            ],
          ),
        ),
        ...closing.deductions.where((d) => !d.deleted).map(
              (d) => LineCard(
                title: d.description ?? d.type,
                subtitle: d.paymentMethod,
                amount: formatMoney(d.amount, currencySymbol),
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
                        if (result != null) {
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
              onPressed: () async {
                final result = await showDeductionSheet(context);
                if (result != null) {
                  await ctrl.addDeduction(
                    type: result.type,
                    description: result.description,
                    amount: result.amount,
                    paymentMethod: result.paymentMethod,
                  );
                }
              },
            ),
          ),
      ],
    );
  }
}
