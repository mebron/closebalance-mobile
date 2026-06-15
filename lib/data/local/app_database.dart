import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

/// Local document store for in-progress daily closing forms.
@DataClassName('EditableClosingRow')
class EditableClosings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get branchId => integer()();
  TextColumn get date => text()();
  IntColumn get serverId => integer().nullable()();
  TextColumn get document => text()();
  BoolColumn get dirty => boolean().withDefault(const Constant(false))();
  IntColumn get updatedAt => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {branchId, date},
      ];
}

@DriftDatabase(tables: [EditableClosings])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _open());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          // Dev-only: the old pending_mutations table is superseded; create the new schema.
          await m.createAll();
        },
      );

  static QueryExecutor _open() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'closebalance.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
