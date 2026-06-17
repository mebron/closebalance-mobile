// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CounterRef _$CounterRefFromJson(Map<String, dynamic> json) =>
    _CounterRef(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$CounterRefToJson(_CounterRef instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_CounterPayment _$CounterPaymentFromJson(Map<String, dynamic> json) =>
    _CounterPayment(
      amount: (json['amount'] as num).toDouble(),
      method: json['method'] as String,
    );

Map<String, dynamic> _$CounterPaymentToJson(_CounterPayment instance) =>
    <String, dynamic>{'amount': instance.amount, 'method': instance.method};

_CounterTransaction _$CounterTransactionFromJson(Map<String, dynamic> json) =>
    _CounterTransaction(
      id: (json['id'] as num).toInt(),
      counterId: (json['counter_id'] as num).toInt(),
      counter: json['counter'] == null
          ? null
          : CounterRef.fromJson(json['counter'] as Map<String, dynamic>),
      date: json['date'] as String,
      saleAmount: (json['sale_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
      payments:
          (json['payments'] as List<dynamic>?)
              ?.map((e) => CounterPayment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CounterPayment>[],
      balance: (json['balance'] as num).toDouble(),
      remarks: json['remarks'] as String?,
    );

Map<String, dynamic> _$CounterTransactionToJson(_CounterTransaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'counter_id': instance.counterId,
      'counter': instance.counter?.toJson(),
      'date': instance.date,
      'sale_amount': instance.saleAmount,
      'paid_amount': instance.paidAmount,
      'payments': instance.payments.map((e) => e.toJson()).toList(),
      'balance': instance.balance,
      'remarks': instance.remarks,
    };
