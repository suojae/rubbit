/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class DiaryAdvice implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int diaryId;

  String encouragement;

  String fortune;

  DateTime createdAt;

  DateTime updatedAt;

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
