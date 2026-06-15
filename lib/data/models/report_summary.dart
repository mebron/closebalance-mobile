import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_summary.freezed.dart';
part 'report_summary.g.dart';

@freezed
abstract class ReportSummary with _$ReportSummary {
  const factory ReportSummary({
    required String date,
    @JsonKey(name: 'total_sales') required double totalSales,
    @JsonKey(name: 'cash_in_hand') required double cashInHand,
    @JsonKey(name: 'draft_closings') required int draftClosings,
    @JsonKey(name: 'finalized_closings') required int finalizedClosings,
    @JsonKey(name: 'total_expenses') required double totalExpenses,
    @JsonKey(name: 'net_position') required double netPosition,
  }) = _ReportSummary;

  factory ReportSummary.fromJson(Map<String, dynamic> json) => _$ReportSummaryFromJson(json);
}
