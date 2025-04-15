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
import 'character.dart' as _i3;
import 'diary.dart' as _i4;
import 'diary_advice.dart' as _i5;
import 'dto/character_request.dart' as _i6;
import 'dto/character_response.dart' as _i7;
import 'dto/diary_request.dart' as _i8;
import 'dto/diary_response.dart' as _i9;
import 'dto/emotion_request.dart' as _i10;
import 'dto/emotion_response.dart' as _i11;
import 'dto/user_request.dart' as _i12;
import 'dto/user_response.dart' as _i13;
import 'emotion.dart' as _i14;
import 'user.dart' as _i15;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'character',
      dartName: 'Character',
      schema: 'public',
      module: 'rubbit_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'character_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'character_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'character_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'diary',
      dartName: 'Diary',
      schema: 'public',
      module: 'rubbit_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'diary_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'content',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'emotionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'diary_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'diary_fk_1',
          columns: ['emotionId'],
          referenceTable: 'emotion',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'diary_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'diary_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'diary_emotion_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'emotionId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'diary_created_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'createdAt',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'diary_advice',
      dartName: 'DiaryAdvice',
      schema: 'public',
      module: 'rubbit_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'diary_advice_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'diaryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'encouragement',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fortune',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'diary_advice_fk_0',
          columns: ['diaryId'],
          referenceTable: 'diary',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'diary_advice_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'diary_advice_diary_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'diaryId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'emotion',
      dartName: 'Emotion',
      schema: 'public',
      module: 'rubbit_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'emotion_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'emotion_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'emotion_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'name',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'rubbit_server',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nickname',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'socialId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'agreedToTerms',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'characterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['characterId'],
          referenceTable: 'character',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_social_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'socialId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'user_character_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'characterId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Character) {
      return _i3.Character.fromJson(data) as T;
    }
    if (t == _i4.Diary) {
      return _i4.Diary.fromJson(data) as T;
    }
    if (t == _i5.DiaryAdvice) {
      return _i5.DiaryAdvice.fromJson(data) as T;
    }
    if (t == _i6.CharacterRequest) {
      return _i6.CharacterRequest.fromJson(data) as T;
    }
    if (t == _i7.CharacterResponse) {
      return _i7.CharacterResponse.fromJson(data) as T;
    }
    if (t == _i8.DiaryRequest) {
      return _i8.DiaryRequest.fromJson(data) as T;
    }
    if (t == _i9.DiaryAdviceResponse) {
      return _i9.DiaryAdviceResponse.fromJson(data) as T;
    }
    if (t == _i10.EmotionRequest) {
      return _i10.EmotionRequest.fromJson(data) as T;
    }
    if (t == _i11.EmotionResponse) {
      return _i11.EmotionResponse.fromJson(data) as T;
    }
    if (t == _i12.UserRequest) {
      return _i12.UserRequest.fromJson(data) as T;
    }
    if (t == _i13.UserResponse) {
      return _i13.UserResponse.fromJson(data) as T;
    }
    if (t == _i14.Emotion) {
      return _i14.Emotion.fromJson(data) as T;
    }
    if (t == _i15.User) {
      return _i15.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Character?>()) {
      return (data != null ? _i3.Character.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Diary?>()) {
      return (data != null ? _i4.Diary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DiaryAdvice?>()) {
      return (data != null ? _i5.DiaryAdvice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.CharacterRequest?>()) {
      return (data != null ? _i6.CharacterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CharacterResponse?>()) {
      return (data != null ? _i7.CharacterResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DiaryRequest?>()) {
      return (data != null ? _i8.DiaryRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DiaryAdviceResponse?>()) {
      return (data != null ? _i9.DiaryAdviceResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.EmotionRequest?>()) {
      return (data != null ? _i10.EmotionRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.EmotionResponse?>()) {
      return (data != null ? _i11.EmotionResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UserRequest?>()) {
      return (data != null ? _i12.UserRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.UserResponse?>()) {
      return (data != null ? _i13.UserResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Emotion?>()) {
      return (data != null ? _i14.Emotion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.User?>()) {
      return (data != null ? _i15.User.fromJson(data) : null) as T;
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
    if (data is _i3.Character) {
      return 'Character';
    }
    if (data is _i4.Diary) {
      return 'Diary';
    }
    if (data is _i5.DiaryAdvice) {
      return 'DiaryAdvice';
    }
    if (data is _i6.CharacterRequest) {
      return 'CharacterRequest';
    }
    if (data is _i7.CharacterResponse) {
      return 'CharacterResponse';
    }
    if (data is _i8.DiaryRequest) {
      return 'DiaryRequest';
    }
    if (data is _i9.DiaryAdviceResponse) {
      return 'DiaryAdviceResponse';
    }
    if (data is _i10.EmotionRequest) {
      return 'EmotionRequest';
    }
    if (data is _i11.EmotionResponse) {
      return 'EmotionResponse';
    }
    if (data is _i12.UserRequest) {
      return 'UserRequest';
    }
    if (data is _i13.UserResponse) {
      return 'UserResponse';
    }
    if (data is _i14.Emotion) {
      return 'Emotion';
    }
    if (data is _i15.User) {
      return 'User';
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
    if (dataClassName == 'Character') {
      return deserialize<_i3.Character>(data['data']);
    }
    if (dataClassName == 'Diary') {
      return deserialize<_i4.Diary>(data['data']);
    }
    if (dataClassName == 'DiaryAdvice') {
      return deserialize<_i5.DiaryAdvice>(data['data']);
    }
    if (dataClassName == 'CharacterRequest') {
      return deserialize<_i6.CharacterRequest>(data['data']);
    }
    if (dataClassName == 'CharacterResponse') {
      return deserialize<_i7.CharacterResponse>(data['data']);
    }
    if (dataClassName == 'DiaryRequest') {
      return deserialize<_i8.DiaryRequest>(data['data']);
    }
    if (dataClassName == 'DiaryAdviceResponse') {
      return deserialize<_i9.DiaryAdviceResponse>(data['data']);
    }
    if (dataClassName == 'EmotionRequest') {
      return deserialize<_i10.EmotionRequest>(data['data']);
    }
    if (dataClassName == 'EmotionResponse') {
      return deserialize<_i11.EmotionResponse>(data['data']);
    }
    if (dataClassName == 'UserRequest') {
      return deserialize<_i12.UserRequest>(data['data']);
    }
    if (dataClassName == 'UserResponse') {
      return deserialize<_i13.UserResponse>(data['data']);
    }
    if (dataClassName == 'Emotion') {
      return deserialize<_i14.Emotion>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i15.User>(data['data']);
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
    switch (t) {
      case _i3.Character:
        return _i3.Character.t;
      case _i4.Diary:
        return _i4.Diary.t;
      case _i5.DiaryAdvice:
        return _i5.DiaryAdvice.t;
      case _i14.Emotion:
        return _i14.Emotion.t;
      case _i15.User:
        return _i15.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'rubbit_server';
}
