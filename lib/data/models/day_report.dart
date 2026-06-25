import 'package:freezed_annotation/freezed_annotation.dart';
import 'report_rows.dart';

part 'day_report.freezed.dart';
part 'day_report.g.dart';

@freezed
abstract class DayReport with _$DayReport {
  const factory DayReport({
    required String date,
    @JsonKey(name: 'total_sales') required double totalSales,
    @JsonKey(name: 'cash_in_hand') required double cashInHand,
    @JsonKey(name: 'draft_closings') required int draftClosings,
    @JsonKey(name: 'finalized_closings') required int finalizedClosings,
    @JsonKey(name: 'total_expenses') required double totalExpenses,
    @JsonKey(name: 'total_deductions') @Default(0.0) double totalDeductions,
    @JsonKey(name: 'net_profit') @Default(0.0) double netProfit,
    @JsonKey(name: 'cash_collections') @Default(0.0) double cashCollections,
    @JsonKey(name: 'cash_expenses') @Default(0.0) double cashExpenses,
    @JsonKey(name: 'cash_deductions') @Default(0.0) double cashDeductions,
    @JsonKey(name: 'total_counter_paid') @Default(0.0) double totalCounterPaid,
    @JsonKey(name: 'online_collections') @Default(0.0) double onlineCollections,
    @JsonKey(name: 'online_expenses') @Default(0.0) double onlineExpenses,
    @JsonKey(name: 'online_deductions') @Default(0.0) double onlineDeductions,
    @JsonKey(name: 'online_net') @Default(0.0) double onlineNet,
    @Default([]) List<ChannelSaleTotal> channels,
    @Default([]) List<ExpenseCategoryTotal> expenses,
    @Default([]) List<DeductionTypeTotal> deductions,
    @Default([]) List<CounterBalanceRow> counters,
  }) = _DayReport;

  factory DayReport.fromJson(Map<String, dynamic> json) => _$DayReportFromJson(json);
}
