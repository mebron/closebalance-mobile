// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_closing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyClosing _$DailyClosingFromJson(
  Map<String, dynamic> json,
) => _DailyClosing(
  id: (json['id'] as num).toInt(),
  date: json['date'] as String,
  status: _statusFromJson(json['status'] as String),
  notes: json['notes'] as String?,
  branch: json['branch'] == null
      ? null
      : Branch.fromJson(json['branch'] as Map<String, dynamic>),
  totalSales: (json['total_sales'] as num?)?.toDouble() ?? 0.0,
  totalExpenses: (json['total_expenses'] as num?)?.toDouble() ?? 0.0,
  totalDeductions: (json['total_deductions'] as num?)?.toDouble() ?? 0.0,
  cashCollections: (json['cash_collections'] as num?)?.toDouble() ?? 0.0,
  onlineCollections: (json['online_collections'] as num?)?.toDouble() ?? 0.0,
  aggregatorCollections:
      (json['aggregator_collections'] as num?)?.toDouble() ?? 0.0,
  totalCounterPaid: (json['total_counter_paid'] as num?)?.toDouble() ?? 0.0,
  cashInHand: (json['cash_in_hand'] as num?)?.toDouble() ?? 0.0,
  netProfit: (json['net_balance'] as num?)?.toDouble() ?? 0.0,
  sales:
      (json['sales'] as List<dynamic>?)
          ?.map((e) => SaleLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SaleLine>[],
  expenses:
      (json['expenses'] as List<dynamic>?)
          ?.map((e) => ExpenseLine.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ExpenseLine>[],
  deductions:
      (json['deductions'] as List<dynamic>?)
          ?.map((e) => Deduction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Deduction>[],
  counterTransactions:
      (json['counter_transactions'] as List<dynamic>?)
          ?.map((e) => CounterTransaction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CounterTransaction>[],
);

Map<String, dynamic> _$DailyClosingToJson(_DailyClosing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': _statusToJson(instance.status),
      'notes': instance.notes,
      'branch': instance.branch?.toJson(),
      'total_sales': instance.totalSales,
      'total_expenses': instance.totalExpenses,
      'total_deductions': instance.totalDeductions,
      'cash_collections': instance.cashCollections,
      'online_collections': instance.onlineCollections,
      'aggregator_collections': instance.aggregatorCollections,
      'total_counter_paid': instance.totalCounterPaid,
      'cash_in_hand': instance.cashInHand,
      'net_balance': instance.netProfit,
      'sales': instance.sales.map((e) => e.toJson()).toList(),
      'expenses': instance.expenses.map((e) => e.toJson()).toList(),
      'deductions': instance.deductions.map((e) => e.toJson()).toList(),
      'counter_transactions': instance.counterTransactions
          .map((e) => e.toJson())
          .toList(),
    };
