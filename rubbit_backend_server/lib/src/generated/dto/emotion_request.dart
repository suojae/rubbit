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

abstract class EmotionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  EmotionRequest._({required this.name});

  factory EmotionRequest({required String name}) = _EmotionRequestImpl;

  factory EmotionRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmotionRequest(name: jsonSerialization['name'] as String);
  }

  String name;

  /// Returns a shallow copy of this [EmotionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmotionRequest copyWith({String? name});
  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'name': name};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _EmotionRequestImpl extends EmotionRequest {
  _EmotionRequestImpl({required String name}) : super._(name: name);

  /// Returns a shallow copy of this [EmotionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmotionRequest copyWith({String? name}) {
    return EmotionRequest(name: name ?? this.name);
  }
}
