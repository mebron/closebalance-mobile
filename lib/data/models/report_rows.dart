import 'package:freezed_annotation/freezed_annotation.dart';
import 'branch.dart';

part 'report_rows.freezed.dart';
part 'report_rows.g.dart';

@freezed
abstract class DailyBranchRow with _$DailyBranchRow {
  const factory DailyBranchRow({
    required int id,
    required String date,
    required String status,
    Branch? branch,
    @JsonKey(name: 'total_sales') @Default(0.0) double totalSales,
    @JsonKey(name: 'total_expenses') @Default(0.0) double totalExpenses,
    @JsonKey(name: 'cash_in_hand') @Default(0.0) double cashInHand,
    @JsonKey(name: 'net_profit') @Default(0.0) double netProfit,
  }) = _DailyBranchRow;

  factory DailyBranchRow.fromJson(Map<String, dynamic> json) => _$DailyBranchRowFromJson(json);
}

@freezed
abstract class ExpenseCategoryTotal with _$ExpenseCategoryTotal {
  const factory ExpenseCategoryTotal({
    required String category,
    required double total,
    required int count,
  }) = _ExpenseCategoryTotal;

  factory ExpenseCategoryTotal.fromJson(Map<String, dynamic> json) => _$ExpenseCategoryTotalFromJson(json);
}

@freezed
abstract class CounterBalanceRow with _$CounterBalanceRow {
  const factory CounterBalanceRow({
    required String counter,
    @JsonKey(name: 'sale_amount') required double saleAmount,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    required double balance,
  }) = _CounterBalanceRow;

  factory CounterBalanceRow.fromJson(Map<String, dynamic> json) => _$CounterBalanceRowFromJson(json);
}

@freezed
abstract class ChannelSaleTotal with _$ChannelSaleTotal {
  const factory ChannelSaleTotal({
    required String channel,
    required String type,
    required double total,
  }) = _ChannelSaleTotal;

  factory ChannelSaleTotal.fromJson(Map<String, dynamic> json) => _$ChannelSaleTotalFromJson(json);
}
