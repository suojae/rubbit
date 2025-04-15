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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.nickname,
    required this.socialId,
    required this.agreedToTerms,
    required this.characterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory User({
    int? id,
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      nickname: jsonSerialization['nickname'] as String,
      socialId: jsonSerialization['socialId'] as String,
      agreedToTerms: jsonSerialization['agreedToTerms'] as bool,
      characterId: jsonSerialization['characterId'] as int,
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

  String nickname;

  String socialId;

  bool agreedToTerms;

  int characterId;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nickname': nickname,
      'socialId': socialId,
      'agreedToTerms': agreedToTerms,
      'characterId': characterId,
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

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          nickname: nickname,
          socialId: socialId,
          agreedToTerms: agreedToTerms,
          characterId: characterId,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id is int? ? id : this.id,
      nickname: nickname ?? this.nickname,
      socialId: socialId ?? this.socialId,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      characterId: characterId ?? this.characterId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
