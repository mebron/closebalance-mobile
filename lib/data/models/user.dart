import 'package:freezed_annotation/freezed_annotation.dart';
import 'company.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'branch_id') int? branchId,
    @Default(<String>[]) List<String> roles,
    required Company company,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Branch-locked users only ever see their own branch and never see the switcher.
  bool get isBranchLocked => branchId != null;

  /// Mirrors Filament's rule: everyone except data_entry_operator can finalize.
  bool get canFinalize => !roles.contains('data_entry_operator');
}
