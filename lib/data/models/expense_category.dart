import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_category.freezed.dart';
part 'expense_category.g.dart';

@freezed
abstract class ExpenseCategory with _$ExpenseCategory {
  const factory ExpenseCategory({
    required int id,
    required String name,
  }) = _ExpenseCategory;

  factory ExpenseCategory.fromJson(Map<String, dynamic> json) =>
      _$ExpenseCategoryFromJson(json);
}
