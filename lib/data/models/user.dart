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

  /// Mirrors Filament's rule: admin/manager/super_admin can finalize.
  /// Positive check so multi-role users (e.g. admin + data_entry_operator) aren't blocked.
  bool get canFinalize => roles.any(
        (r) => const {'super_admin', 'admin', 'manager'}.contains(r),
      );
}
