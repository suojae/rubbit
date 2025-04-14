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

abstract class UserRequest implements _i1.SerializableModel {
  UserRequest._({
    required this.nickname,
    required this.socialId,
    required this.agreedToTerms,
    required this.characterId,
  });

  factory UserRequest({
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
  }) = _UserRequestImpl;

  factory UserRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRequest(
      nickname: jsonSerialization['nickname'] as String,
      socialId: jsonSerialization['socialId'] as String,
      agreedToTerms: jsonSerialization['agreedToTerms'] as bool,
      characterId: jsonSerialization['characterId'] as int,
    );
  }

  String nickname;

  String socialId;

  bool agreedToTerms;

  int characterId;

  /// Returns a shallow copy of this [UserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRequest copyWith({
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'socialId': socialId,
      'agreedToTerms': agreedToTerms,
      'characterId': characterId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserRequestImpl extends UserRequest {
  _UserRequestImpl({
    required String nickname,
    required String socialId,
    required bool agreedToTerms,
    required int characterId,
  }) : super._(
          nickname: nickname,
          socialId: socialId,
          agreedToTerms: agreedToTerms,
          characterId: characterId,
        );

  /// Returns a shallow copy of this [UserRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRequest copyWith({
    String? nickname,
    String? socialId,
    bool? agreedToTerms,
    int? characterId,
  }) {
    return UserRequest(
      nickname: nickname ?? this.nickname,
      socialId: socialId ?? this.socialId,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      characterId: characterId ?? this.characterId,
    );
  }
}
