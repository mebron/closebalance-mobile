import 'package:freezed_annotation/freezed_annotation.dart';
import '../closing_status.dart';

part 'editable_closing.freezed.dart';
part 'editable_closing.g.dart';

ClosingStatus _statusFromJson(String v) => ClosingStatus.fromString(v);
String _statusToJson(ClosingStatus s) => s == ClosingStatus.finalized ? 'finalized' : 'draft';

@freezed
abstract class EditableSale with _$EditableSale {
  const factory EditableSale({
    required String clientId,
    @JsonKey(name: 'server_id') int? serverId,
    @JsonKey(name: 'payment_channel_id') required int paymentChannelId,
    required double amount,
    @Default(false) bool dirty,
    @Default(false) bool deleted,
  }) = _EditableSale;
  factory EditableSale.fromJson(Map<String, dynamic> json) => _$EditableSaleFromJson(json);
}

@freezed
abstract class EditableExpense with _$EditableExpense {
  const factory EditableExpense({
    required String clientId,
    @JsonKey(name: 'server_id') int? serverId,
    @JsonKey(name: 'expense_category_id') required int expenseCategoryId,
    String? description,
    required double amount,
    @JsonKey(name: 'payment_channel_id') int? paymentChannelId,
    @Default(false) bool dirty,
    @Default(false) bool deleted,
  }) = _EditableExpense;
  factory EditableExpense.fromJson(Map<String, dynamic> json) => _$EditableExpenseFromJson(json);
}

@freezed
abstract class EditableDeduction with _$EditableDeduction {
  const factory EditableDeduction({
    required String clientId,
    @JsonKey(name: 'server_id') int? serverId,
    required String type,
    String? description,
    required double amount,
    @JsonKey(name: 'payment_channel_id') int? paymentChannelId,
    @Default(false) bool dirty,
    @Default(false) bool deleted,
  }) = _EditableDeduction;
  factory EditableDeduction.fromJson(Map<String, dynamic> json) => _$EditableDeductionFromJson(json);
}

@freezed
abstract class EditablePayment with _$EditablePayment {
  const factory EditablePayment({
    required double amount,
    @JsonKey(name: 'payment_method') @Default('cash') String paymentMethod,
  }) = _EditablePayment;
  factory EditablePayment.fromJson(Map<String, dynamic> json) => _$EditablePaymentFromJson(json);
}

@freezed
abstract class EditableCounterTxn with _$EditableCounterTxn {
  const EditableCounterTxn._();

  const factory EditableCounterTxn({
    required String clientId,
    @JsonKey(name: 'server_id') int? serverId,
    @JsonKey(name: 'counter_id') required int counterId,
    @JsonKey(name: 'sale_amount') required double saleAmount,
    @Default(<EditablePayment>[]) List<EditablePayment> payments,
    String? remarks,
    @Default(false) bool dirty,
    @Default(false) bool deleted,
  }) = _EditableCounterTxn;
  factory EditableCounterTxn.fromJson(Map<String, dynamic> json) => _$EditableCounterTxnFromJson(json);

  double get paidAmount => payments.fold(0.0, (s, p) => s + p.amount);
}

@freezed
abstract class EditableClosing with _$EditableClosing {
  const factory EditableClosing({
    @JsonKey(name: 'server_id') int? serverId,
    @JsonKey(name: 'branch_id') required int branchId,
    required String date,
    @JsonKey(fromJson: _statusFromJson, toJson: _statusToJson) required ClosingStatus status,
    String? notes,
    @JsonKey(name: 'total_sales') @Default(0.0) double totalSales,
    @Default(<EditableSale>[]) List<EditableSale> sales,
    @Default(<EditableExpense>[]) List<EditableExpense> expenses,
    @Default(<EditableDeduction>[]) List<EditableDeduction> deductions,
    @JsonKey(name: 'counter_transactions')
    @Default(<EditableCounterTxn>[]) List<EditableCounterTxn> counterTransactions,
    @JsonKey(name: 'header_dirty') @Default(false) bool headerDirty,
  }) = _EditableClosing;
  factory EditableClosing.fromJson(Map<String, dynamic> json) => _$EditableClosingFromJson(json);
}
