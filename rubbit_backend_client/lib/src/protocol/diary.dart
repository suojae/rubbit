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

abstract class Diary implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String content;

  int emotionId;

  DateTime createdAt;

  DateTime updatedAt;

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
