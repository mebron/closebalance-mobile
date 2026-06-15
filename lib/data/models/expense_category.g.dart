// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseCategory _$ExpenseCategoryFromJson(Map<String, dynamic> json) =>
    _ExpenseCategory(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$ExpenseCategoryToJson(_ExpenseCategory instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
