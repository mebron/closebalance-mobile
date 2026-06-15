import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch.freezed.dart';
part 'branch.g.dart';

@freezed
abstract class Branch with _$Branch {
  const factory Branch({
    required int id,
    required String name,
    String? code,
    String? address,
    String? phone,
  }) = _Branch;

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}
