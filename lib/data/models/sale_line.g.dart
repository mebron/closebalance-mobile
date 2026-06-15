// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleLine _$SaleLineFromJson(Map<String, dynamic> json) => _SaleLine(
  id: (json['id'] as num).toInt(),
  paymentChannelId: (json['payment_channel_id'] as num).toInt(),
  paymentChannel: json['payment_channel'] == null
      ? null
      : PaymentChannel.fromJson(
          json['payment_channel'] as Map<String, dynamic>,
        ),
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$SaleLineToJson(_SaleLine instance) => <String, dynamic>{
  'id': instance.id,
  'payment_channel_id': instance.paymentChannelId,
  'payment_channel': instance.paymentChannel?.toJson(),
  'amount': instance.amount,
};
