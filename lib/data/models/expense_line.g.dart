// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpenseLine _$ExpenseLineFromJson(Map<String, dynamic> json) => _ExpenseLine(
  id: (json['id'] as num).toInt(),
  expenseCategoryId: (json['expense_category_id'] as num).toInt(),
  category: json['category'] == null
      ? null
      : ExpenseCategory.fromJson(json['category'] as Map<String, dynamic>),
  description: json['description'] as String?,
  amount: (json['amount'] as num).toDouble(),
  paymentChannelId: (json['payment_channel_id'] as num?)?.toInt(),
  paidVia: json['paid_via'] as String?,
  remarks: json['remarks'] as String?,
);

Map<String, dynamic> _$ExpenseLineToJson(_ExpenseLine instance) =>
    <String, dynamic>{
      'id': instance.id,
      'expense_category_id': instance.expenseCategoryId,
      'category': instance.category?.toJson(),
      'description': instance.description,
      'amount': instance.amount,
      'payment_channel_id': instance.paymentChannelId,
      'paid_via': instance.paidVia,
      'remarks': instance.remarks,
    };
