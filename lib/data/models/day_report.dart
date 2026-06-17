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
    @JsonKey(name: 'net_profit') required double netProfit,
    @Default([]) List<ChannelSaleTotal> channels,
    @Default([]) List<ExpenseCategoryTotal> expenses,
    @Default([]) List<DeductionTypeTotal> deductions,
    @Default([]) List<CounterBalanceRow> counters,
  }) = _DayReport;

  factory DayReport.fromJson(Map<String, dynamic> json) => _$DayReportFromJson(json);
}
