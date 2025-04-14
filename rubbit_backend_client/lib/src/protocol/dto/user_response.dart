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

abstract class UserResponse implements _i1.SerializableModel {
  UserResponse._({
    required this.id,
    required this.nickname,
    required this.socialId,
    required this.agreedToTerms,
    required this.characterId,
    this.characterName,
    required this.createdAt,
    this.updatedAt,
  });

  factory UserResponse({
    required int id,
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
    String? characterName,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserResponseImpl;

  factory UserResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserResponse(
      id: jsonSerialization['id'] as int,
      nickname: jsonSerialization['nickname'] as String,
      socialId: jsonSerialization['socialId'] as String,
      agreedToTerms: jsonSerialization['agreedToTerms'] as bool,
      characterId: jsonSerialization['characterId'] as int,
      characterName: jsonSerialization['characterName'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  int id;

  String nickname;

  String socialId;

  bool agreedToTerms;

  int characterId;

  String? characterName;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [UserResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserResponse copyWith({
    int? id,
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
    String? characterName,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'socialId': socialId,
      'agreedToTerms': agreedToTerms,
      'characterId': characterId,
      if (characterName != null) 'characterName': characterName,
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

class _UserResponseImpl extends UserResponse {
  _UserResponseImpl({
    required int id,
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
    String? characterName,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          nickname: nickname,
          socialId: socialId,
          agreedToTerms: agreedToTerms,
          characterId: characterId,
          characterName: characterName,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [UserResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserResponse copyWith({
    int? id,
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
    Object? characterName = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return UserResponse(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      socialId: socialId ?? this.socialId,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      characterId: characterId ?? this.characterId,
      characterName:
          characterName is String? ? characterName : this.characterName,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
