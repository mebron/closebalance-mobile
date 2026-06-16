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
  netPosition: (json['net_position'] as num).toDouble(),
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
      'net_position': instance.netPosition,
      'channels': instance.channels.map((e) => e.toJson()).toList(),
      'expenses': instance.expenses.map((e) => e.toJson()).toList(),
      'counters': instance.counters.map((e) => e.toJson()).toList(),
    };
