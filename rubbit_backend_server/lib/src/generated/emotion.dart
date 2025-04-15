/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Emotion implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Emotion._({
    this.id,
    required this.name,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Emotion({
    int? id,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _EmotionImpl;

  factory Emotion.fromJson(Map<String, dynamic> jsonSerialization) {
    return Emotion(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = EmotionTable();

  static const db = EmotionRepository._();

  @override
  int? id;

  String name;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Emotion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Emotion copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static EmotionInclude include() {
    return EmotionInclude._();
  }

  static EmotionIncludeList includeList({
    _i1.WhereExpressionBuilder<EmotionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmotionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmotionTable>? orderByList,
    EmotionInclude? include,
  }) {
    return EmotionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Emotion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Emotion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmotionImpl extends Emotion {
  _EmotionImpl({
    int? id,
    required String name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Emotion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Emotion copyWith({
    Object? id = _Undefined,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Emotion(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class EmotionTable extends _i1.Table<int> {
  EmotionTable({super.tableRelation}) : super(tableName: 'emotion') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        createdAt,
        updatedAt,
      ];
}

class EmotionInclude extends _i1.IncludeObject {
  EmotionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Emotion.t;
}

class EmotionIncludeList extends _i1.IncludeList {
  EmotionIncludeList._({
    _i1.WhereExpressionBuilder<EmotionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Emotion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Emotion.t;
}

class EmotionRepository {
  const EmotionRepository._();

  /// Returns a list of [Emotion]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Emotion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmotionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmotionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmotionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Emotion>(
      where: where?.call(Emotion.t),
      orderBy: orderBy?.call(Emotion.t),
      orderByList: orderByList?.call(Emotion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Emotion] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Emotion?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmotionTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmotionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmotionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Emotion>(
      where: where?.call(Emotion.t),
      orderBy: orderBy?.call(Emotion.t),
      orderByList: orderByList?.call(Emotion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Emotion] by its [id] or null if no such row exists.
  Future<Emotion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Emotion>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Emotion]s in the list and returns the inserted rows.
  ///
  /// The returned [Emotion]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Emotion>> insert(
    _i1.Session session,
    List<Emotion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Emotion>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Emotion] and returns the inserted row.
  ///
  /// The returned [Emotion] will have its `id` field set.
  Future<Emotion> insertRow(
    _i1.Session session,
    Emotion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Emotion>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Emotion]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Emotion>> update(
    _i1.Session session,
    List<Emotion> rows, {
    _i1.ColumnSelections<EmotionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Emotion>(
      rows,
      columns: columns?.call(Emotion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Emotion]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Emotion> updateRow(
    _i1.Session session,
    Emotion row, {
    _i1.ColumnSelections<EmotionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Emotion>(
      row,
      columns: columns?.call(Emotion.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Emotion]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Emotion>> delete(
    _i1.Session session,
    List<Emotion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Emotion>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Emotion].
  Future<Emotion> deleteRow(
    _i1.Session session,
    Emotion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Emotion>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Emotion>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmotionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Emotion>(
      where: where(Emotion.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmotionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Emotion>(
      where: where?.call(Emotion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
