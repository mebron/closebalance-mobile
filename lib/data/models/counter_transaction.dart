import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_transaction.freezed.dart';
part 'counter_transaction.g.dart';

@freezed
abstract class CounterRef with _$CounterRef {
  const factory CounterRef({required int id, required String name}) = _CounterRef;

  factory CounterRef.fromJson(Map<String, dynamic> json) => _$CounterRefFromJson(json);
}

@freezed
abstract class CounterTransaction with _$CounterTransaction {
  const factory CounterTransaction({
    required int id,
    @JsonKey(name: 'counter_id') required int counterId,
    CounterRef? counter,
    required String date,
    @JsonKey(name: 'sale_amount') required double saleAmount,
    @JsonKey(name: 'paid_amount') required double paidAmount,
    required double balance,
    String? remarks,
  }) = _CounterTransaction;

  factory CounterTransaction.fromJson(Map<String, dynamic> json) => _$CounterTransactionFromJson(json);
}
