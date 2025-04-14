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
import '../dto/diary_response.dart' as _i2;

abstract class DiaryAdviceResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DiaryAdviceResponse._({
    required this.id,
    required this.userId,
    required this.content,
    required this.emotionId,
    this.emotionName,
    required this.createdAt,
    this.updatedAt,
    this.advice,
  });

  factory DiaryAdviceResponse({
    required int id,
    required int userId,
    required String content,
    required int emotionId,
    String? emotionName,
    required DateTime createdAt,
    DateTime? updatedAt,
    _i2.DiaryAdviceResponse? advice,
  }) = _DiaryAdviceResponseImpl;

  factory DiaryAdviceResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiaryAdviceResponse(
      id: jsonSerialization['id'] as int,
      userId: jsonSerialization['userId'] as int,
      content: jsonSerialization['content'] as String,
      emotionId: jsonSerialization['emotionId'] as int,
      emotionName: jsonSerialization['emotionName'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      advice: jsonSerialization['advice'] == null
          ? null
          : _i2.DiaryAdviceResponse.fromJson(
              (jsonSerialization['advice'] as Map<String, dynamic>)),
    );
  }

  int id;

  int userId;

  String content;

  int emotionId;

  String? emotionName;

  DateTime createdAt;

  DateTime? updatedAt;

  _i2.DiaryAdviceResponse? advice;

  /// Returns a shallow copy of this [DiaryAdviceResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiaryAdviceResponse copyWith({
    int? id,
    int? userId,
    String? content,
    int? emotionId,
    String? emotionName,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i2.DiaryAdviceResponse? advice,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'emotionId': emotionId,
      if (emotionName != null) 'emotionName': emotionName,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (advice != null) 'advice': advice?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'id': id,
      'userId': userId,
      'content': content,
      'emotionId': emotionId,
      if (emotionName != null) 'emotionName': emotionName,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (advice != null) 'advice': advice?.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DiaryAdviceResponseImpl extends DiaryAdviceResponse {
  _DiaryAdviceResponseImpl({
    required int id,
    required int userId,
    required String content,
    required int emotionId,
    String? emotionName,
    required DateTime createdAt,
    DateTime? updatedAt,
    _i2.DiaryAdviceResponse? advice,
  }) : super._(
          id: id,
          userId: userId,
          content: content,
          emotionId: emotionId,
          emotionName: emotionName,
          createdAt: createdAt,
          updatedAt: updatedAt,
          advice: advice,
        );

  /// Returns a shallow copy of this [DiaryAdviceResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiaryAdviceResponse copyWith({
    int? id,
    int? userId,
    String? content,
    int? emotionId,
    Object? emotionName = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
    Object? advice = _Undefined,
  }) {
    return DiaryAdviceResponse(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      emotionId: emotionId ?? this.emotionId,
      emotionName: emotionName is String? ? emotionName : this.emotionName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      advice:
          advice is _i2.DiaryAdviceResponse? ? advice : this.advice?.copyWith(),
    );
  }
}
