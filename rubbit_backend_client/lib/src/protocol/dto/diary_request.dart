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

abstract class DiaryRequest implements _i1.SerializableModel {
  DiaryRequest._({
    required this.userId,
    required this.content,
    required this.emotionId,
  });

  factory DiaryRequest({
    required int userId,
    required String content,
    required int emotionId,
  }) = _DiaryRequestImpl;

  factory DiaryRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return DiaryRequest(
      userId: jsonSerialization['userId'] as int,
      content: jsonSerialization['content'] as String,
      emotionId: jsonSerialization['emotionId'] as int,
    );
  }

  int userId;

  String content;

  int emotionId;

  /// Returns a shallow copy of this [DiaryRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DiaryRequest copyWith({
    int? userId,
    String? content,
    int? emotionId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'content': content,
      'emotionId': emotionId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DiaryRequestImpl extends DiaryRequest {
  _DiaryRequestImpl({
    required int userId,
    required String content,
    required int emotionId,
  }) : super._(
          userId: userId,
          content: content,
          emotionId: emotionId,
        );

  /// Returns a shallow copy of this [DiaryRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DiaryRequest copyWith({
    int? userId,
    String? content,
    int? emotionId,
  }) {
    return DiaryRequest(
      userId: userId ?? this.userId,
      content: content ?? this.content,
      emotionId: emotionId ?? this.emotionId,
    );
  }
}
