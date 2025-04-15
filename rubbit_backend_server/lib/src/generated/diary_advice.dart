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

abstract class DiaryAdvice
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  DiaryAdvice._({
    this.id,
    required this.diaryId,
    required this.encouragement,
    required this.fortune,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory DiaryAdvice({
    int? id,
    required int diaryId,
    required String encouragement,
    required String fortune,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DiaryAdviceImpl;

  factory DiaryAdvice.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiaryAdvice(
      id: jsonSerialization['id'] as int?,
      diaryId: jsonSerialization['diaryId'] as int,
      encouragement: jsonSerialization['encouragement'] as String,
      fortune: jsonSerialization['fortune'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = DiaryAdviceTable();

  static const db = DiaryAdviceRepository._();

  @override
  int? id;

  int diaryId;

  String encouragement;

  String fortune;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [DiaryAdvice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiaryAdvice copyWith({
    int? id,
    int? diaryId,
    String? encouragement,
    String? fortune,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'diaryId': diaryId,
      'encouragement': encouragement,
      'fortune': fortune,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'diaryId': diaryId,
      'encouragement': encouragement,
      'fortune': fortune,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static DiaryAdviceInclude include() {
    return DiaryAdviceInclude._();
  }

  static DiaryAdviceIncludeList includeList({
    _i1.WhereExpressionBuilder<DiaryAdviceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiaryAdviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryAdviceTable>? orderByList,
    DiaryAdviceInclude? include,
  }) {
    return DiaryAdviceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DiaryAdvice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DiaryAdvice.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiaryAdviceImpl extends DiaryAdvice {
  _DiaryAdviceImpl({
    int? id,
    required int diaryId,
    required String encouragement,
    required String fortune,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          diaryId: diaryId,
          encouragement: encouragement,
          fortune: fortune,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [DiaryAdvice]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiaryAdvice copyWith({
    Object? id = _Undefined,
    int? diaryId,
    String? encouragement,
    String? fortune,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DiaryAdvice(
      id: id is int? ? id : this.id,
      diaryId: diaryId ?? this.diaryId,
      encouragement: encouragement ?? this.encouragement,
      fortune: fortune ?? this.fortune,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class DiaryAdviceTable extends _i1.Table<int> {
  DiaryAdviceTable({super.tableRelation}) : super(tableName: 'diary_advice') {
    diaryId = _i1.ColumnInt(
      'diaryId',
      this,
    );
    encouragement = _i1.ColumnString(
      'encouragement',
      this,
    );
    fortune = _i1.ColumnString(
      'fortune',
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

  late final _i1.ColumnInt diaryId;

  late final _i1.ColumnString encouragement;

  late final _i1.ColumnString fortune;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
        id,
        diaryId,
        encouragement,
        fortune,
        createdAt,
        updatedAt,
      ];
}

class DiaryAdviceInclude extends _i1.IncludeObject {
  DiaryAdviceInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => DiaryAdvice.t;
}

class DiaryAdviceIncludeList extends _i1.IncludeList {
  DiaryAdviceIncludeList._({
    _i1.WhereExpressionBuilder<DiaryAdviceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DiaryAdvice.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => DiaryAdvice.t;
}

class DiaryAdviceRepository {
  const DiaryAdviceRepository._();

  /// Returns a list of [DiaryAdvice]s matching the given query parameters.
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
  Future<List<DiaryAdvice>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryAdviceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DiaryAdviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryAdviceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DiaryAdvice>(
      where: where?.call(DiaryAdvice.t),
      orderBy: orderBy?.call(DiaryAdvice.t),
      orderByList: orderByList?.call(DiaryAdvice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DiaryAdvice] matching the given query parameters.
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
  Future<DiaryAdvice?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryAdviceTable>? where,
    int? offset,
    _i1.OrderByBuilder<DiaryAdviceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DiaryAdviceTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DiaryAdvice>(
      where: where?.call(DiaryAdvice.t),
      orderBy: orderBy?.call(DiaryAdvice.t),
      orderByList: orderByList?.call(DiaryAdvice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DiaryAdvice] by its [id] or null if no such row exists.
  Future<DiaryAdvice?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DiaryAdvice>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DiaryAdvice]s in the list and returns the inserted rows.
  ///
  /// The returned [DiaryAdvice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DiaryAdvice>> insert(
    _i1.Session session,
    List<DiaryAdvice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DiaryAdvice>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DiaryAdvice] and returns the inserted row.
  ///
  /// The returned [DiaryAdvice] will have its `id` field set.
  Future<DiaryAdvice> insertRow(
    _i1.Session session,
    DiaryAdvice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DiaryAdvice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DiaryAdvice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DiaryAdvice>> update(
    _i1.Session session,
    List<DiaryAdvice> rows, {
    _i1.ColumnSelections<DiaryAdviceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DiaryAdvice>(
      rows,
      columns: columns?.call(DiaryAdvice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DiaryAdvice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DiaryAdvice> updateRow(
    _i1.Session session,
    DiaryAdvice row, {
    _i1.ColumnSelections<DiaryAdviceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DiaryAdvice>(
      row,
      columns: columns?.call(DiaryAdvice.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DiaryAdvice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DiaryAdvice>> delete(
    _i1.Session session,
    List<DiaryAdvice> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DiaryAdvice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DiaryAdvice].
  Future<DiaryAdvice> deleteRow(
    _i1.Session session,
    DiaryAdvice row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DiaryAdvice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DiaryAdvice>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DiaryAdviceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DiaryAdvice>(
      where: where(DiaryAdvice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DiaryAdviceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DiaryAdvice>(
      where: where?.call(DiaryAdvice.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
