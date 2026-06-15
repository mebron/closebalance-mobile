// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Branch _$BranchFromJson(Map<String, dynamic> json) => _Branch(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  code: json['code'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$BranchToJson(_Branch instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'address': instance.address,
  'phone': instance.phone,
};
