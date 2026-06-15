import 'branch.dart';
import 'counter.dart';
import 'expense_category.dart';
import 'payment_channel.dart';

/// Aggregated master data loaded once on login and cached for offline open.
class ReferenceData {
  ReferenceData({
    required this.branches,
    required this.paymentChannels,
    required this.expenseCategories,
    required this.currencySymbol,
    required this.counters,
  });

  final List<Branch> branches;
  final List<PaymentChannel> paymentChannels;
  final List<ExpenseCategory> expenseCategories;
  final String currencySymbol;
  final List<Counter> counters;

  Map<String, dynamic> toJson() => {
        'branches': branches.map((b) => b.toJson()).toList(),
        'payment_channels': paymentChannels.map((p) => p.toJson()).toList(),
        'expense_categories': expenseCategories.map((c) => c.toJson()).toList(),
        'currency_symbol': currencySymbol,
        'counters': counters.map((c) => c.toJson()).toList(),
      };

  factory ReferenceData.fromJson(Map<String, dynamic> json) => ReferenceData(
        branches: (json['branches'] as List)
            .map((e) => Branch.fromJson(e as Map<String, dynamic>))
            .toList(),
        paymentChannels: (json['payment_channels'] as List)
            .map((e) => PaymentChannel.fromJson(e as Map<String, dynamic>))
            .toList(),
        expenseCategories: (json['expense_categories'] as List)
            .map((e) => ExpenseCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
        currencySymbol: json['currency_symbol'] as String,
        counters: (json['counters'] as List? ?? const [])
            .map((e) => Counter.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
