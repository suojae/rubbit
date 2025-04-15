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

abstract class Diary implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Diary._({
    this.id,
    required this.userId,
    required this.content,
    required this.emotionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Diary({
    int? id,
    required int userId,
    required String content,
    required int emotionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DiaryImpl;

  factory Diary.fromJson(Map<String, dynamic> jsonSerialization) {
    return Diary(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      content: jsonSerialization['content'] as String,
      emotionId: jsonSerialization['emotionId'] as int,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = DiaryTable();

  static const db = DiaryRepository._();

  @override
  int? id;

  int userId;

  String content;

  int emotionId;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Diary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Diary copyWith({
    int? id,
    int? userId,
    String? content,
    int? emotionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'content': content,
      'emotionId': emotionId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      'content': content,
      'emotionId': emotionId,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static DiaryInclude include() {
    return DiaryInclude._();
  }

  static DiaryIncludeList includeList({
    _i1.WhereExpressionBuilder<DiaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryTable>? orderByList,
    DiaryInclude? include,
  }) {
    return DiaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Diary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Diary.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiaryImpl extends Diary {
  _DiaryImpl({
    int? id,
    required int userId,
    required String content,
    required int emotionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          content: content,
          emotionId: emotionId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [Diary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Diary copyWith({
    Object? id = _Undefined,
    int? userId,
    String? content,
    int? emotionId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Diary(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      emotionId: emotionId ?? this.emotionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class DiaryTable extends _i1.Table<int> {
  DiaryTable({super.tableRelation}) : super(tableName: 'diary') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    emotionId = _i1.ColumnInt(
      'emotionId',
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

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString content;

  late final _i1.ColumnInt emotionId;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        content,
        emotionId,
        createdAt,
        updatedAt,
      ];
}

class DiaryInclude extends _i1.IncludeObject {
  DiaryInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Diary.t;
}

class DiaryIncludeList extends _i1.IncludeList {
  DiaryIncludeList._({
    _i1.WhereExpressionBuilder<DiaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Diary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Diary.t;
}

class DiaryRepository {
  const DiaryRepository._();

  /// Returns a list of [Diary]s matching the given query parameters.
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
  Future<List<Diary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Diary>(
      where: where?.call(Diary.t),
      orderBy: orderBy?.call(Diary.t),
      orderByList: orderByList?.call(Diary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Diary] matching the given query parameters.
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
  Future<Diary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<DiaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Diary>(
      where: where?.call(Diary.t),
      orderBy: orderBy?.call(Diary.t),
      orderByList: orderByList?.call(Diary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Diary] by its [id] or null if no such row exists.
  Future<Diary?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Diary>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Diary]s in the list and returns the inserted rows.
  ///
  /// The returned [Diary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Diary>> insert(
    _i1.Session session,
    List<Diary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Diary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Diary] and returns the inserted row.
  ///
  /// The returned [Diary] will have its `id` field set.
  Future<Diary> insertRow(
    _i1.Session session,
    Diary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Diary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Diary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Diary>> update(
    _i1.Session session,
    List<Diary> rows, {
    _i1.ColumnSelections<DiaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Diary>(
      rows,
      columns: columns?.call(Diary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Diary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Diary> updateRow(
    _i1.Session session,
    Diary row, {
    _i1.ColumnSelections<DiaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Diary>(
      row,
      columns: columns?.call(Diary.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Diary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Diary>> delete(
    _i1.Session session,
    List<Diary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Diary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Diary].
  Future<Diary> deleteRow(
    _i1.Session session,
    Diary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Diary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Diary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DiaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Diary>(
      where: where(Diary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Diary>(
      where: where?.call(Diary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
