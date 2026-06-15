import 'package:closebalance_mobile/data/local/editable_closing_store.dart';
import 'package:closebalance_mobile/data/models/editable/editable_closing.dart';

class FakeEditableClosingStore implements EditableClosingStore {
  final Map<String, ({EditableClosing closing, bool dirty})> _byKey = {};
  String _k(int b, String d) => '$b|$d';

  @override
  Future<EditableClosing?> load(int branchId, String date) async => _byKey[_k(branchId, date)]?.closing;

  @override
  Future<void> save(EditableClosing closing, {required bool dirty}) async =>
      _byKey[_k(closing.branchId, closing.date)] = (closing: closing, dirty: dirty);

  @override
  Future<List<EditableClosing>> dirtyClosings() async =>
      _byKey.values.where((e) => e.dirty).map((e) => e.closing).toList();

  @override
  Future<void> delete(int branchId, String date) async => _byKey.remove(_k(branchId, date));
}
