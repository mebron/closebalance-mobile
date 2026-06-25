// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DayReport _$DayReportFromJson(Map<String, dynamic> json) => _DayReport(
  date: json['date'] as String,
  totalSales: (json['total_sales'] as num).toDouble(),
  cashInHand: (json['cash_in_hand'] as num).toDouble(),
  draftClosings: (json['draft_closings'] as num).toInt(),
  finalizedClosings: (json['finalized_closings'] as num).toInt(),
  totalExpenses: (json['total_expenses'] as num).toDouble(),
  totalDeductions: (json['total_deductions'] as num?)?.toDouble() ?? 0.0,
  netProfit: (json['net_profit'] as num?)?.toDouble() ?? 0.0,
  cashCollections: (json['cash_collections'] as num?)?.toDouble() ?? 0.0,
  cashExpenses: (json['cash_expenses'] as num?)?.toDouble() ?? 0.0,
  cashDeductions: (json['cash_deductions'] as num?)?.toDouble() ?? 0.0,
  totalCounterPaid: (json['total_counter_paid'] as num?)?.toDouble() ?? 0.0,
  channels:
      (json['channels'] as List<dynamic>?)
          ?.map((e) => ChannelSaleTotal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  expenses:
      (json['expenses'] as List<dynamic>?)
          ?.map((e) => ExpenseCategoryTotal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  deductions:
      (json['deductions'] as List<dynamic>?)
          ?.map((e) => DeductionTypeTotal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  counters:
      (json['counters'] as List<dynamic>?)
          ?.map((e) => CounterBalanceRow.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$DayReportToJson(_DayReport instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total_sales': instance.totalSales,
      'cash_in_hand': instance.cashInHand,
      'draft_closings': instance.draftClosings,
      'finalized_closings': instance.finalizedClosings,
      'total_expenses': instance.totalExpenses,
      'total_deductions': instance.totalDeductions,
      'net_profit': instance.netProfit,
      'cash_collections': instance.cashCollections,
      'cash_expenses': instance.cashExpenses,
      'cash_deductions': instance.cashDeductions,
      'total_counter_paid': instance.totalCounterPaid,
      'channels': instance.channels.map((e) => e.toJson()).toList(),
      'expenses': instance.expenses.map((e) => e.toJson()).toList(),
      'deductions': instance.deductions.map((e) => e.toJson()).toList(),
      'counters': instance.counters.map((e) => e.toJson()).toList(),
    };
