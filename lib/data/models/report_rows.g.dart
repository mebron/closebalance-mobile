// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyBranchRow _$DailyBranchRowFromJson(Map<String, dynamic> json) =>
    _DailyBranchRow(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String,
      status: json['status'] as String,
      branch: json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>),
      totalSales: (json['total_sales'] as num?)?.toDouble() ?? 0.0,
      totalExpenses: (json['total_expenses'] as num?)?.toDouble() ?? 0.0,
      cashInHand: (json['cash_in_hand'] as num?)?.toDouble() ?? 0.0,
      netPosition: (json['net_position'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$DailyBranchRowToJson(_DailyBranchRow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': instance.status,
      'branch': instance.branch?.toJson(),
      'total_sales': instance.totalSales,
      'total_expenses': instance.totalExpenses,
      'cash_in_hand': instance.cashInHand,
      'net_position': instance.netPosition,
    };

_ExpenseCategoryTotal _$ExpenseCategoryTotalFromJson(
  Map<String, dynamic> json,
) => _ExpenseCategoryTotal(
  category: json['category'] as String,
  total: (json['total'] as num).toDouble(),
  count: (json['count'] as num).toInt(),
);

Map<String, dynamic> _$ExpenseCategoryTotalToJson(
  _ExpenseCategoryTotal instance,
) => <String, dynamic>{
  'category': instance.category,
  'total': instance.total,
  'count': instance.count,
};

_CounterBalanceRow _$CounterBalanceRowFromJson(Map<String, dynamic> json) =>
    _CounterBalanceRow(
      counter: json['counter'] as String,
      saleAmount: (json['sale_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$CounterBalanceRowToJson(_CounterBalanceRow instance) =>
    <String, dynamic>{
      'counter': instance.counter,
      'sale_amount': instance.saleAmount,
      'paid_amount': instance.paidAmount,
      'balance': instance.balance,
    };
