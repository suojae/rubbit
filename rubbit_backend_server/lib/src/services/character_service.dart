import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// 캐릭터 관련 비즈니스 로직을 처리하는 서비스 클래스
class CharacterService {
  final ServerpodSessionManager _sessionManager;

  /// 생성자
  CharacterService(this._sessionManager);

  /// 모든 캐릭터 조회
  Future<List<Character>> getAllCharacters({Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await Character.find(session);
  }

  /// 캐릭터 ID로 캐릭터 조회
  Future<Character?> getCharacterById(int characterId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await Character.findById(session, characterId);
  }

  /// 캐릭터 이름으로 캐릭터 조회
  Future<Character?> getCharacterByName(String name, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final characters = await Character.find(
      session,
      where: (c) => c.name.equals(name),
    );

    return characters.isNotEmpty ? characters.first : null;
  }

  /// 새 캐릭터 생성
  Future<Character> createCharacter(CharacterRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 이름 중복 확인
    final existingCharacter = await getCharacterByName(request.name, session: session);
    if (existingCharacter != null) {
      throw Exception('이미 존재하는 캐릭터 이름입니다: ${request.name}');
    }

    final character = Character(name: request.name);
    await character.save(session);
    return character;
  }

  /// 캐릭터 정보 업데이트
  Future<Character> updateCharacter(UpdateCharacterParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final character = await getCharacterById(params.characterId, session: session);
    if (character == null) {
      throw Exception('캐릭터를 찾을 수 없습니다: ${params.characterId}');
    }

    if (params.name != null) {
      // 이름 중복 확인
      final existingCharacter = await getCharacterByName(params.name!, session: session);
      if (existingCharacter != null && existingCharacter.id != character.id) {
        throw Exception('이미 존재하는 캐릭터 이름입니다: ${params.name}');
      }

      character.name = params.name!;
    }

    await character.save(session);
    return character;
  }

  /// 캐릭터 삭제
  Future<void> deleteCharacter(int characterId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final character = await getCharacterById(characterId, session: session);
    if (character == null) {
      throw Exception('캐릭터를 찾을 수 없습니다: $characterId');
    }

    // 해당 캐릭터를 사용하는 사용자 확인
    final users = await User.find(
      session,
      where: (u) => u.characterId.equals(characterId),
    );

    if (users.isNotEmpty) {
      throw Exception('이 캐릭터를 사용하는 사용자가 있어 삭제할 수 없습니다.');
    }

    await Character.deleteRow(session, character);
  }

  /// 캐릭터 응답 DTO 생성
  CharacterResponse createCharacterResponse(Character character) {
    return CharacterResponse(
      id: character.id!,
      name: character.name,
    );
  }
}