// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deduction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Deduction _$DeductionFromJson(Map<String, dynamic> json) => _Deduction(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  description: json['description'] as String?,
  amount: (json['amount'] as num).toDouble(),
  paymentChannelId: (json['payment_channel_id'] as num?)?.toInt(),
  paidVia: json['paid_via'] as String?,
);

Map<String, dynamic> _$DeductionToJson(_Deduction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'description': instance.description,
      'amount': instance.amount,
      'payment_channel_id': instance.paymentChannelId,
      'paid_via': instance.paidVia,
    };
