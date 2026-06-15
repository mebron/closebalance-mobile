// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Company _$CompanyFromJson(Map<String, dynamic> json) => _Company(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  currencySymbol: json['currency_symbol'] as String,
);

Map<String, dynamic> _$CompanyToJson(_Company instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'currency_symbol': instance.currencySymbol,
};
