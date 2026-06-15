// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $EditableClosingsTable extends EditableClosings
    with TableInfo<$EditableClosingsTable, EditableClosingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EditableClosingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _branchIdMeta = const VerificationMeta(
    'branchId',
  );
  @override
  late final GeneratedColumn<int> branchId = GeneratedColumn<int>(
    'branch_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _serverIdMeta = const VerificationMeta(
    'serverId',
  );
  @override
  late final GeneratedColumn<int> serverId = GeneratedColumn<int>(
    'server_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _documentMeta = const VerificationMeta(
    'document',
  );
  @override
  late final GeneratedColumn<String> document = GeneratedColumn<String>(
    'document',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dirtyMeta = const VerificationMeta('dirty');
  @override
  late final GeneratedColumn<bool> dirty = GeneratedColumn<bool>(
    'dirty',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("dirty" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    branchId,
    date,
    serverId,
    document,
    dirty,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'editable_closings';
  @override
  VerificationContext validateIntegrity(
    Insertable<EditableClosingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('branch_id')) {
      context.handle(
        _branchIdMeta,
        branchId.isAcceptableOrUnknown(data['branch_id']!, _branchIdMeta),
      );
    } else if (isInserting) {
      context.missing(_branchIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(
        _serverIdMeta,
        serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta),
      );
    }
    if (data.containsKey('document')) {
      context.handle(
        _documentMeta,
        document.isAcceptableOrUnknown(data['document']!, _documentMeta),
      );
    } else if (isInserting) {
      context.missing(_documentMeta);
    }
    if (data.containsKey('dirty')) {
      context.handle(
        _dirtyMeta,
        dirty.isAcceptableOrUnknown(data['dirty']!, _dirtyMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {branchId, date},
  ];
  @override
  EditableClosingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EditableClosingRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      branchId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}branch_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      serverId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}server_id'],
      ),
      document: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document'],
      )!,
      dirty: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}dirty'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $EditableClosingsTable createAlias(String alias) {
    return $EditableClosingsTable(attachedDatabase, alias);
  }
}

class EditableClosingRow extends DataClass
    implements Insertable<EditableClosingRow> {
  final int id;
  final int branchId;
  final String date;
  final int? serverId;
  final String document;
  final bool dirty;
  final int updatedAt;
  const EditableClosingRow({
    required this.id,
    required this.branchId,
    required this.date,
    this.serverId,
    required this.document,
    required this.dirty,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['branch_id'] = Variable<int>(branchId);
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int>(serverId);
    }
    map['document'] = Variable<String>(document);
    map['dirty'] = Variable<bool>(dirty);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  EditableClosingsCompanion toCompanion(bool nullToAbsent) {
    return EditableClosingsCompanion(
      id: Value(id),
      branchId: Value(branchId),
      date: Value(date),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
      document: Value(document),
      dirty: Value(dirty),
      updatedAt: Value(updatedAt),
    );
  }

  factory EditableClosingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EditableClosingRow(
      id: serializer.fromJson<int>(json['id']),
      branchId: serializer.fromJson<int>(json['branchId']),
      date: serializer.fromJson<String>(json['date']),
      serverId: serializer.fromJson<int?>(json['serverId']),
      document: serializer.fromJson<String>(json['document']),
      dirty: serializer.fromJson<bool>(json['dirty']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'branchId': serializer.toJson<int>(branchId),
      'date': serializer.toJson<String>(date),
      'serverId': serializer.toJson<int?>(serverId),
      'document': serializer.toJson<String>(document),
      'dirty': serializer.toJson<bool>(dirty),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  EditableClosingRow copyWith({
    int? id,
    int? branchId,
    String? date,
    Value<int?> serverId = const Value.absent(),
    String? document,
    bool? dirty,
    int? updatedAt,
  }) => EditableClosingRow(
    id: id ?? this.id,
    branchId: branchId ?? this.branchId,
    date: date ?? this.date,
    serverId: serverId.present ? serverId.value : this.serverId,
    document: document ?? this.document,
    dirty: dirty ?? this.dirty,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  EditableClosingRow copyWithCompanion(EditableClosingsCompanion data) {
    return EditableClosingRow(
      id: data.id.present ? data.id.value : this.id,
      branchId: data.branchId.present ? data.branchId.value : this.branchId,
      date: data.date.present ? data.date.value : this.date,
      serverId: data.serverId.present ? data.serverId.value : this.serverId,
      document: data.document.present ? data.document.value : this.document,
      dirty: data.dirty.present ? data.dirty.value : this.dirty,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EditableClosingRow(')
          ..write('id: $id, ')
          ..write('branchId: $branchId, ')
          ..write('date: $date, ')
          ..write('serverId: $serverId, ')
          ..write('document: $document, ')
          ..write('dirty: $dirty, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, branchId, date, serverId, document, dirty, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EditableClosingRow &&
          other.id == this.id &&
          other.branchId == this.branchId &&
          other.date == this.date &&
          other.serverId == this.serverId &&
          other.document == this.document &&
          other.dirty == this.dirty &&
          other.updatedAt == this.updatedAt);
}

class EditableClosingsCompanion extends UpdateCompanion<EditableClosingRow> {
  final Value<int> id;
  final Value<int> branchId;
  final Value<String> date;
  final Value<int?> serverId;
  final Value<String> document;
  final Value<bool> dirty;
  final Value<int> updatedAt;
  const EditableClosingsCompanion({
    this.id = const Value.absent(),
    this.branchId = const Value.absent(),
    this.date = const Value.absent(),
    this.serverId = const Value.absent(),
    this.document = const Value.absent(),
    this.dirty = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  EditableClosingsCompanion.insert({
    this.id = const Value.absent(),
    required int branchId,
    required String date,
    this.serverId = const Value.absent(),
    required String document,
    this.dirty = const Value.absent(),
    required int updatedAt,
  }) : branchId = Value(branchId),
       date = Value(date),
       document = Value(document),
       updatedAt = Value(updatedAt);
  static Insertable<EditableClosingRow> custom({
    Expression<int>? id,
    Expression<int>? branchId,
    Expression<String>? date,
    Expression<int>? serverId,
    Expression<String>? document,
    Expression<bool>? dirty,
    Expression<int>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (branchId != null) 'branch_id': branchId,
      if (date != null) 'date': date,
      if (serverId != null) 'server_id': serverId,
      if (document != null) 'document': document,
      if (dirty != null) 'dirty': dirty,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  EditableClosingsCompanion copyWith({
    Value<int>? id,
    Value<int>? branchId,
    Value<String>? date,
    Value<int?>? serverId,
    Value<String>? document,
    Value<bool>? dirty,
    Value<int>? updatedAt,
  }) {
    return EditableClosingsCompanion(
      id: id ?? this.id,
      branchId: branchId ?? this.branchId,
      date: date ?? this.date,
      serverId: serverId ?? this.serverId,
      document: document ?? this.document,
      dirty: dirty ?? this.dirty,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (branchId.present) {
      map['branch_id'] = Variable<int>(branchId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int>(serverId.value);
    }
    if (document.present) {
      map['document'] = Variable<String>(document.value);
    }
    if (dirty.present) {
      map['dirty'] = Variable<bool>(dirty.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EditableClosingsCompanion(')
          ..write('id: $id, ')
          ..write('branchId: $branchId, ')
          ..write('date: $date, ')
          ..write('serverId: $serverId, ')
          ..write('document: $document, ')
          ..write('dirty: $dirty, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $EditableClosingsTable editableClosings = $EditableClosingsTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [editableClosings];
}

typedef $$EditableClosingsTableCreateCompanionBuilder =
    EditableClosingsCompanion Function({
      Value<int> id,
      required int branchId,
      required String date,
      Value<int?> serverId,
      required String document,
      Value<bool> dirty,
      required int updatedAt,
    });
typedef $$EditableClosingsTableUpdateCompanionBuilder =
    EditableClosingsCompanion Function({
      Value<int> id,
      Value<int> branchId,
      Value<String> date,
      Value<int?> serverId,
      Value<String> document,
      Value<bool> dirty,
      Value<int> updatedAt,
    });

class $$EditableClosingsTableFilterComposer
    extends Composer<_$AppDatabase, $EditableClosingsTable> {
  $$EditableClosingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get branchId => $composableBuilder(
    column: $table.branchId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get document => $composableBuilder(
    column: $table.document,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dirty => $composableBuilder(
    column: $table.dirty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$EditableClosingsTableOrderingComposer
    extends Composer<_$AppDatabase, $EditableClosingsTable> {
  $$EditableClosingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get branchId => $composableBuilder(
    column: $table.branchId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get serverId => $composableBuilder(
    column: $table.serverId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get document => $composableBuilder(
    column: $table.document,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dirty => $composableBuilder(
    column: $table.dirty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EditableClosingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EditableClosingsTable> {
  $$EditableClosingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get branchId =>
      $composableBuilder(column: $table.branchId, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get serverId =>
      $composableBuilder(column: $table.serverId, builder: (column) => column);

  GeneratedColumn<String> get document =>
      $composableBuilder(column: $table.document, builder: (column) => column);

  GeneratedColumn<bool> get dirty =>
      $composableBuilder(column: $table.dirty, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$EditableClosingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EditableClosingsTable,
          EditableClosingRow,
          $$EditableClosingsTableFilterComposer,
          $$EditableClosingsTableOrderingComposer,
          $$EditableClosingsTableAnnotationComposer,
          $$EditableClosingsTableCreateCompanionBuilder,
          $$EditableClosingsTableUpdateCompanionBuilder,
          (
            EditableClosingRow,
            BaseReferences<
              _$AppDatabase,
              $EditableClosingsTable,
              EditableClosingRow
            >,
          ),
          EditableClosingRow,
          PrefetchHooks Function()
        > {
  $$EditableClosingsTableTableManager(
    _$AppDatabase db,
    $EditableClosingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EditableClosingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EditableClosingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EditableClosingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> branchId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<int?> serverId = const Value.absent(),
                Value<String> document = const Value.absent(),
                Value<bool> dirty = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
              }) => EditableClosingsCompanion(
                id: id,
                branchId: branchId,
                date: date,
                serverId: serverId,
                document: document,
                dirty: dirty,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int branchId,
                required String date,
                Value<int?> serverId = const Value.absent(),
                required String document,
                Value<bool> dirty = const Value.absent(),
                required int updatedAt,
              }) => EditableClosingsCompanion.insert(
                id: id,
                branchId: branchId,
                date: date,
                serverId: serverId,
                document: document,
                dirty: dirty,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$EditableClosingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EditableClosingsTable,
      EditableClosingRow,
      $$EditableClosingsTableFilterComposer,
      $$EditableClosingsTableOrderingComposer,
      $$EditableClosingsTableAnnotationComposer,
      $$EditableClosingsTableCreateCompanionBuilder,
      $$EditableClosingsTableUpdateCompanionBuilder,
      (
        EditableClosingRow,
        BaseReferences<
          _$AppDatabase,
          $EditableClosingsTable,
          EditableClosingRow
        >,
      ),
      EditableClosingRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$EditableClosingsTableTableManager get editableClosings =>
      $$EditableClosingsTableTableManager(_db, _db.editableClosings);
}
