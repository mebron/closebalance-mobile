import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
abstract class Counter with _$Counter {
  const factory Counter({
    required int id,
    required String name,
    @JsonKey(name: 'branch_id') int? branchId,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) => _$CounterFromJson(json);
}
