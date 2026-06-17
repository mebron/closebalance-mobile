// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReportSummary _$ReportSummaryFromJson(Map<String, dynamic> json) =>
    _ReportSummary(
      date: json['date'] as String,
      totalSales: (json['total_sales'] as num).toDouble(),
      cashInHand: (json['cash_in_hand'] as num).toDouble(),
      draftClosings: (json['draft_closings'] as num).toInt(),
      finalizedClosings: (json['finalized_closings'] as num).toInt(),
      totalExpenses: (json['total_expenses'] as num).toDouble(),
      netProfit: (json['net_profit'] as num).toDouble(),
    );

Map<String, dynamic> _$ReportSummaryToJson(_ReportSummary instance) =>
    <String, dynamic>{
      'date': instance.date,
      'total_sales': instance.totalSales,
      'cash_in_hand': instance.cashInHand,
      'draft_closings': instance.draftClosings,
      'finalized_closings': instance.finalizedClosings,
      'total_expenses': instance.totalExpenses,
      'net_profit': instance.netProfit,
    };
