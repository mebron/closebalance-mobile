import 'dart:convert';
import 'package:drift/drift.dart';
import '../models/editable/editable_closing.dart';
import 'app_database.dart';

abstract interface class EditableClosingStore {
  Future<EditableClosing?> load(int branchId, String date);
  Future<void> save(EditableClosing closing, {required bool dirty});
  Future<List<EditableClosing>> dirtyClosings();
  Future<void> delete(int branchId, String date);
}

class DriftEditableClosingStore implements EditableClosingStore {
  DriftEditableClosingStore(this._db);
  final AppDatabase _db;

  EditableClosing _decode(EditableClosingRow r) =>
      EditableClosing.fromJson(jsonDecode(r.document) as Map<String, dynamic>);

  @override
  Future<EditableClosing?> load(int branchId, String date) async {
    final row = await (_db.select(_db.editableClosings)
          ..where((t) => t.branchId.equals(branchId) & t.date.equals(date)))
        .getSingleOrNull();
    return row == null ? null : _decode(row);
  }

  @override
  Future<void> save(EditableClosing closing, {required bool dirty}) async {
    final existing = await (_db.select(_db.editableClosings)
          ..where((t) => t.branchId.equals(closing.branchId) & t.date.equals(closing.date)))
        .getSingleOrNull();
    final companion = EditableClosingsCompanion(
      id: existing == null ? const Value.absent() : Value(existing.id),
      branchId: Value(closing.branchId),
      date: Value(closing.date),
      serverId: Value(closing.serverId),
      document: Value(jsonEncode(closing.toJson())),
      dirty: Value(dirty),
      updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
    );
    if (existing == null) {
      await _db.into(_db.editableClosings).insert(companion);
    } else {
      await (_db.update(_db.editableClosings)..where((t) => t.id.equals(existing.id))).write(companion);
    }
  }

  @override
  Future<List<EditableClosing>> dirtyClosings() async {
    final rows = await (_db.select(_db.editableClosings)..where((t) => t.dirty.equals(true))).get();
    return rows.map(_decode).toList();
  }

  @override
  Future<void> delete(int branchId, String date) =>
      (_db.delete(_db.editableClosings)..where((t) => t.branchId.equals(branchId) & t.date.equals(date))).go();
}
