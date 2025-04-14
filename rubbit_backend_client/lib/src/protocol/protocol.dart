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
import 'dto/character_request.dart' as _i2;
import 'dto/character_response.dart' as _i3;
import 'dto/diary_request.dart' as _i4;
import 'dto/diary_response.dart' as _i5;
import 'dto/emotion_request.dart' as _i6;
import 'dto/emotion_response.dart' as _i7;
import 'dto/user_request.dart' as _i8;
import 'dto/user_response.dart' as _i9;
export 'dto/character_request.dart';
export 'dto/character_response.dart';
export 'dto/diary_request.dart';
export 'dto/diary_response.dart';
export 'dto/emotion_request.dart';
export 'dto/emotion_response.dart';
export 'dto/user_request.dart';
export 'dto/user_response.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.CharacterRequest) {
      return _i2.CharacterRequest.fromJson(data) as T;
    }
    if (t == _i3.CharacterResponse) {
      return _i3.CharacterResponse.fromJson(data) as T;
    }
    if (t == _i4.DiaryRequest) {
      return _i4.DiaryRequest.fromJson(data) as T;
    }
    if (t == _i5.DiaryAdviceResponse) {
      return _i5.DiaryAdviceResponse.fromJson(data) as T;
    }
    if (t == _i6.EmotionRequest) {
      return _i6.EmotionRequest.fromJson(data) as T;
    }
    if (t == _i7.EmotionResponse) {
      return _i7.EmotionResponse.fromJson(data) as T;
    }
    if (t == _i8.UserRequest) {
      return _i8.UserRequest.fromJson(data) as T;
    }
    if (t == _i9.UserResponse) {
      return _i9.UserResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CharacterRequest?>()) {
      return (data != null ? _i2.CharacterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CharacterResponse?>()) {
      return (data != null ? _i3.CharacterResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DiaryRequest?>()) {
      return (data != null ? _i4.DiaryRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DiaryAdviceResponse?>()) {
      return (data != null ? _i5.DiaryAdviceResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.EmotionRequest?>()) {
      return (data != null ? _i6.EmotionRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.EmotionResponse?>()) {
      return (data != null ? _i7.EmotionResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.UserRequest?>()) {
      return (data != null ? _i8.UserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserResponse?>()) {
      return (data != null ? _i9.UserResponse.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.CharacterRequest) {
      return 'CharacterRequest';
    }
    if (data is _i3.CharacterResponse) {
      return 'CharacterResponse';
    }
    if (data is _i4.DiaryRequest) {
      return 'DiaryRequest';
    }
    if (data is _i5.DiaryAdviceResponse) {
      return 'DiaryAdviceResponse';
    }
    if (data is _i6.EmotionRequest) {
      return 'EmotionRequest';
    }
    if (data is _i7.EmotionResponse) {
      return 'EmotionResponse';
    }
    if (data is _i8.UserRequest) {
      return 'UserRequest';
    }
    if (data is _i9.UserResponse) {
      return 'UserResponse';
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
      return deserialize<_i2.CharacterRequest>(data['data']);
    }
    if (dataClassName == 'CharacterResponse') {
      return deserialize<_i3.CharacterResponse>(data['data']);
    }
    if (dataClassName == 'DiaryRequest') {
      return deserialize<_i4.DiaryRequest>(data['data']);
    }
    if (dataClassName == 'DiaryAdviceResponse') {
      return deserialize<_i5.DiaryAdviceResponse>(data['data']);
    }
    if (dataClassName == 'EmotionRequest') {
      return deserialize<_i6.EmotionRequest>(data['data']);
    }
    if (dataClassName == 'EmotionResponse') {
      return deserialize<_i7.EmotionResponse>(data['data']);
    }
    if (dataClassName == 'UserRequest') {
      return deserialize<_i8.UserRequest>(data['data']);
    }
    if (dataClassName == 'UserResponse') {
      return deserialize<_i9.UserResponse>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
