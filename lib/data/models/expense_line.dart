import 'package:freezed_annotation/freezed_annotation.dart';
import 'expense_category.dart';

part 'expense_line.freezed.dart';
part 'expense_line.g.dart';

@freezed
abstract class ExpenseLine with _$ExpenseLine {
  const factory ExpenseLine({
    required int id,
    @JsonKey(name: 'expense_category_id') required int expenseCategoryId,
    ExpenseCategory? category,
    required String description,
    required double amount,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    String? remarks,
  }) = _ExpenseLine;

  factory ExpenseLine.fromJson(Map<String, dynamic> json) => _$ExpenseLineFromJson(json);
}
