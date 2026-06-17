import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_transaction.freezed.dart';
part 'counter_transaction.g.dart';

@freezed
abstract class CounterRef with _$CounterRef {
  const factory CounterRef({required int id, required String name}) = _CounterRef;

  factory CounterRef.fromJson(Map<String, dynamic> json) => _$CounterRefFromJson(json);
}

@freezed
abstract class CounterPayment with _$CounterPayment {
  const factory CounterPayment({
    required double amount,
    required String method,
  }) = _CounterPayment;

  factory CounterPayment.fromJson(Map<String, dynamic> json) => _$CounterPaymentFromJson(json);
}

@freezed
abstract class CounterTransaction with _$CounterTransaction {
  const CounterTransaction._();

  const factory CounterTransaction({
    required int id,
    @JsonKey(name: 'counter_id') required int counterId,
    CounterRef? counter,
    required String date,
    @JsonKey(name: 'sale_amount') required double saleAmount,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    @Default(<CounterPayment>[]) List<CounterPayment> payments,
    required double balance,
    String? remarks,
  }) = _CounterTransaction;

  factory CounterTransaction.fromJson(Map<String, dynamic> json) => _$CounterTransactionFromJson(json);
}
