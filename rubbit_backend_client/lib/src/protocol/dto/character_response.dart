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

abstract class CharacterResponse implements _i1.SerializableModel {
  CharacterResponse._({
    required this.id,
    required this.name,
  });

  factory CharacterResponse({
    required int id,
    required String name,
  }) = _CharacterResponseImpl;

  factory CharacterResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return CharacterResponse(
      id: jsonSerialization['id'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  int id;

  String name;

  /// Returns a shallow copy of this [CharacterResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CharacterResponse copyWith({
    int? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CharacterResponseImpl extends CharacterResponse {
  _CharacterResponseImpl({
    required int id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [CharacterResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CharacterResponse copyWith({
    int? id,
    String? name,
  }) {
    return CharacterResponse(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
