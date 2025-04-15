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
import 'character.dart' as _i2;
import 'diary.dart' as _i3;
import 'diary_advice.dart' as _i4;
import 'dto/character_request.dart' as _i5;
import 'dto/character_response.dart' as _i6;
import 'dto/diary_request.dart' as _i7;
import 'dto/diary_response.dart' as _i8;
import 'dto/emotion_request.dart' as _i9;
import 'dto/emotion_response.dart' as _i10;
import 'dto/user_request.dart' as _i11;
import 'dto/user_response.dart' as _i12;
import 'emotion.dart' as _i13;
import 'user.dart' as _i14;
export 'character.dart';
export 'diary.dart';
export 'diary_advice.dart';
export 'dto/character_request.dart';
export 'dto/character_response.dart';
export 'dto/diary_request.dart';
export 'dto/diary_response.dart';
export 'dto/emotion_request.dart';
export 'dto/emotion_response.dart';
export 'dto/user_request.dart';
export 'dto/user_response.dart';
export 'emotion.dart';
export 'user.dart';
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
    if (t == _i2.Character) {
      return _i2.Character.fromJson(data) as T;
    }
    if (t == _i3.Diary) {
      return _i3.Diary.fromJson(data) as T;
    }
    if (t == _i4.DiaryAdvice) {
      return _i4.DiaryAdvice.fromJson(data) as T;
    }
    if (t == _i5.CharacterRequest) {
      return _i5.CharacterRequest.fromJson(data) as T;
    }
    if (t == _i6.CharacterResponse) {
      return _i6.CharacterResponse.fromJson(data) as T;
    }
    if (t == _i7.DiaryRequest) {
      return _i7.DiaryRequest.fromJson(data) as T;
    }
    if (t == _i8.DiaryAdviceResponse) {
      return _i8.DiaryAdviceResponse.fromJson(data) as T;
    }
    if (t == _i9.EmotionRequest) {
      return _i9.EmotionRequest.fromJson(data) as T;
    }
    if (t == _i10.EmotionResponse) {
      return _i10.EmotionResponse.fromJson(data) as T;
    }
    if (t == _i11.UserRequest) {
      return _i11.UserRequest.fromJson(data) as T;
    }
    if (t == _i12.UserResponse) {
      return _i12.UserResponse.fromJson(data) as T;
    }
    if (t == _i13.Emotion) {
      return _i13.Emotion.fromJson(data) as T;
    }
    if (t == _i14.User) {
      return _i14.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Character?>()) {
      return (data != null ? _i2.Character.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Diary?>()) {
      return (data != null ? _i3.Diary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DiaryAdvice?>()) {
      return (data != null ? _i4.DiaryAdvice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.CharacterRequest?>()) {
      return (data != null ? _i5.CharacterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CharacterResponse?>()) {
      return (data != null ? _i6.CharacterResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DiaryRequest?>()) {
      return (data != null ? _i7.DiaryRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DiaryAdviceResponse?>()) {
      return (data != null ? _i8.DiaryAdviceResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.EmotionRequest?>()) {
      return (data != null ? _i9.EmotionRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.EmotionResponse?>()) {
      return (data != null ? _i10.EmotionResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.UserRequest?>()) {
      return (data != null ? _i11.UserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UserResponse?>()) {
      return (data != null ? _i12.UserResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Emotion?>()) {
      return (data != null ? _i13.Emotion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.User?>()) {
      return (data != null ? _i14.User.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Character) {
      return 'Character';
    }
    if (data is _i3.Diary) {
      return 'Diary';
    }
    if (data is _i4.DiaryAdvice) {
      return 'DiaryAdvice';
    }
    if (data is _i5.CharacterRequest) {
      return 'CharacterRequest';
    }
    if (data is _i6.CharacterResponse) {
      return 'CharacterResponse';
    }
    if (data is _i7.DiaryRequest) {
      return 'DiaryRequest';
    }
    if (data is _i8.DiaryAdviceResponse) {
      return 'DiaryAdviceResponse';
    }
    if (data is _i9.EmotionRequest) {
      return 'EmotionRequest';
    }
    if (data is _i10.EmotionResponse) {
      return 'EmotionResponse';
    }
    if (data is _i11.UserRequest) {
      return 'UserRequest';
    }
    if (data is _i12.UserResponse) {
      return 'UserResponse';
    }
    if (data is _i13.Emotion) {
      return 'Emotion';
    }
    if (data is _i14.User) {
      return 'User';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Character') {
      return deserialize<_i2.Character>(data['data']);
    }
    if (dataClassName == 'Diary') {
      return deserialize<_i3.Diary>(data['data']);
    }
    if (dataClassName == 'DiaryAdvice') {
      return deserialize<_i4.DiaryAdvice>(data['data']);
    }
    if (dataClassName == 'CharacterRequest') {
      return deserialize<_i5.CharacterRequest>(data['data']);
    }
    if (dataClassName == 'CharacterResponse') {
      return deserialize<_i6.CharacterResponse>(data['data']);
    }
    if (dataClassName == 'DiaryRequest') {
      return deserialize<_i7.DiaryRequest>(data['data']);
    }
    if (dataClassName == 'DiaryAdviceResponse') {
      return deserialize<_i8.DiaryAdviceResponse>(data['data']);
    }
    if (dataClassName == 'EmotionRequest') {
      return deserialize<_i9.EmotionRequest>(data['data']);
    }
    if (dataClassName == 'EmotionResponse') {
      return deserialize<_i10.EmotionResponse>(data['data']);
    }
    if (dataClassName == 'UserRequest') {
      return deserialize<_i11.UserRequest>(data['data']);
    }
    if (dataClassName == 'UserResponse') {
      return deserialize<_i12.UserResponse>(data['data']);
    }
    if (dataClassName == 'Emotion') {
      return deserialize<_i13.Emotion>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i14.User>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
