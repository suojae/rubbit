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

abstract class EmotionResponse implements _i1.SerializableModel {
  EmotionResponse._({
    required this.id,
    required this.name,
    required this.createdAt,
    this.updatedAt,
  });

  factory EmotionResponse({
    required int id,
    required String name,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _EmotionResponseImpl;

  factory EmotionResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmotionResponse(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  int id;

  String name;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [EmotionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmotionResponse copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmotionResponseImpl extends EmotionResponse {
  _EmotionResponseImpl({
    required int id,
    required String name,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [EmotionResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmotionResponse copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return EmotionResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
