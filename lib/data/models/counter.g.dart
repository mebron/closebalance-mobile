// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Counter _$CounterFromJson(Map<String, dynamic> json) => _Counter(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  branchId: (json['branch_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CounterToJson(_Counter instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'branch_id': instance.branchId,
};
