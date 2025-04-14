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
import 'package:serverpod/protocol.dart' as _i2;
import 'dto/character_request.dart' as _i3;
import 'dto/character_response.dart' as _i4;
import 'dto/diary_request.dart' as _i5;
import 'dto/diary_response.dart' as _i6;
import 'dto/emotion_request.dart' as _i7;
import 'dto/emotion_response.dart' as _i8;
import 'dto/user_request.dart' as _i9;
import 'dto/user_response.dart' as _i10;
export 'dto/character_request.dart';
export 'dto/character_response.dart';
export 'dto/diary_request.dart';
export 'dto/diary_response.dart';
export 'dto/emotion_request.dart';
export 'dto/emotion_response.dart';
export 'dto/user_request.dart';
export 'dto/user_response.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.CharacterRequest) {
      return _i3.CharacterRequest.fromJson(data) as T;
    }
    if (t == _i4.CharacterResponse) {
      return _i4.CharacterResponse.fromJson(data) as T;
    }
    if (t == _i5.DiaryRequest) {
      return _i5.DiaryRequest.fromJson(data) as T;
    }
    if (t == _i6.DiaryAdviceResponse) {
      return _i6.DiaryAdviceResponse.fromJson(data) as T;
    }
    if (t == _i7.EmotionRequest) {
      return _i7.EmotionRequest.fromJson(data) as T;
    }
    if (t == _i8.EmotionResponse) {
      return _i8.EmotionResponse.fromJson(data) as T;
    }
    if (t == _i9.UserRequest) {
      return _i9.UserRequest.fromJson(data) as T;
    }
    if (t == _i10.UserResponse) {
      return _i10.UserResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.CharacterRequest?>()) {
      return (data != null ? _i3.CharacterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CharacterResponse?>()) {
      return (data != null ? _i4.CharacterResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DiaryRequest?>()) {
      return (data != null ? _i5.DiaryRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DiaryAdviceResponse?>()) {
      return (data != null ? _i6.DiaryAdviceResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.EmotionRequest?>()) {
      return (data != null ? _i7.EmotionRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.EmotionResponse?>()) {
      return (data != null ? _i8.EmotionResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserRequest?>()) {
      return (data != null ? _i9.UserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.UserResponse?>()) {
      return (data != null ? _i10.UserResponse.fromJson(data) : null) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.CharacterRequest) {
      return 'CharacterRequest';
    }
    if (data is _i4.CharacterResponse) {
      return 'CharacterResponse';
    }
    if (data is _i5.DiaryRequest) {
      return 'DiaryRequest';
    }
    if (data is _i6.DiaryAdviceResponse) {
      return 'DiaryAdviceResponse';
    }
    if (data is _i7.EmotionRequest) {
      return 'EmotionRequest';
    }
    if (data is _i8.EmotionResponse) {
      return 'EmotionResponse';
    }
    if (data is _i9.UserRequest) {
      return 'UserRequest';
    }
    if (data is _i10.UserResponse) {
      return 'UserResponse';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CharacterRequest') {
      return deserialize<_i3.CharacterRequest>(data['data']);
    }
    if (dataClassName == 'CharacterResponse') {
      return deserialize<_i4.CharacterResponse>(data['data']);
    }
    if (dataClassName == 'DiaryRequest') {
      return deserialize<_i5.DiaryRequest>(data['data']);
    }
    if (dataClassName == 'DiaryAdviceResponse') {
      return deserialize<_i6.DiaryAdviceResponse>(data['data']);
    }
    if (dataClassName == 'EmotionRequest') {
      return deserialize<_i7.EmotionRequest>(data['data']);
    }
    if (dataClassName == 'EmotionResponse') {
      return deserialize<_i8.EmotionResponse>(data['data']);
    }
    if (dataClassName == 'UserRequest') {
      return deserialize<_i9.UserRequest>(data['data']);
    }
    if (dataClassName == 'UserResponse') {
      return deserialize<_i10.UserResponse>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'rubbit_server';
}
