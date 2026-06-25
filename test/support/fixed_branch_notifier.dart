import 'package:closebalance_mobile/core/providers.dart';

/// Test double: locks [SelectedBranchNotifier] to a fixed branch ID.
class FixedBranchNotifier extends SelectedBranchNotifier {
  FixedBranchNotifier(this._id);
  final int? _id;
  @override
  int? build() => _id;
}
