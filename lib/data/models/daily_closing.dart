import 'package:freezed_annotation/freezed_annotation.dart';
import 'branch.dart';
import 'closing_status.dart';
import 'counter_transaction.dart';
import 'deduction.dart';
import 'expense_line.dart';
import 'sale_line.dart';

part 'daily_closing.freezed.dart';
part 'daily_closing.g.dart';

ClosingStatus _statusFromJson(String v) => ClosingStatus.fromString(v);
String _statusToJson(ClosingStatus s) => s == ClosingStatus.finalized ? 'finalized' : 'draft';

@freezed
abstract class DailyClosing with _$DailyClosing {
  const DailyClosing._();

  const factory DailyClosing({
    required int id,
    required String date,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson)
    required ClosingStatus status,
    String? notes,
    Branch? branch,
    @JsonKey(name: 'total_sales') @Default(0.0) double totalSales,
    @JsonKey(name: 'total_expenses') @Default(0.0) double totalExpenses,
    @JsonKey(name: 'total_deductions') @Default(0.0) double totalDeductions,
    @JsonKey(name: 'cash_collections') @Default(0.0) double cashCollections,
    @JsonKey(name: 'online_collections') @Default(0.0) double onlineCollections,
    @JsonKey(name: 'aggregator_collections') @Default(0.0) double aggregatorCollections,
    @JsonKey(name: 'total_counter_paid') @Default(0.0) double totalCounterPaid,
    @JsonKey(name: 'cash_in_hand') @Default(0.0) double cashInHand,
    @JsonKey(name: 'net_profit') @Default(0.0) double netProfit,
    @Default(<SaleLine>[]) List<SaleLine> sales,
    @Default(<ExpenseLine>[]) List<ExpenseLine> expenses,
    @Default(<Deduction>[]) List<Deduction> deductions,
    @JsonKey(name: 'counter_transactions')
    @Default(<CounterTransaction>[]) List<CounterTransaction> counterTransactions,
  }) = _DailyClosing;

  factory DailyClosing.fromJson(Map<String, dynamic> json) => _$DailyClosingFromJson(json);

  bool get statusIsFinalized => status == ClosingStatus.finalized;
}
