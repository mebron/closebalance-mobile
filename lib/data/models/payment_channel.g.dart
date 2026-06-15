// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentChannel _$PaymentChannelFromJson(Map<String, dynamic> json) =>
    _PaymentChannel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$PaymentChannelToJson(_PaymentChannel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };
