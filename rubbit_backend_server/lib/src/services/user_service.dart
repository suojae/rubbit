import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'character_service.dart';

/// 사용자 관련 비즈니스 로직을 처리하는 서비스 클래스
class UserService {
  final ServerpodSessionManager _sessionManager;
  final CharacterService _characterService;

  /// 생성자
  UserService(this._sessionManager, this._characterService);

  /// 사용자 ID로 사용자 조회
  Future<User?> getUserById(int userId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await User.findById(session, userId);
  }

  /// 소셜 ID로 사용자 조회
  Future<User?> getUserBySocialId(String socialId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final users = await User.find(
      session,
      where: (u) => u.socialId.equals(socialId),
    );

    return users.isNotEmpty ? users.first : null;
  }

  /// 새 사용자 생성
  Future<User> createUser(UserRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 캐릭터 확인
    final character = await _characterService.getCharacterById(request.characterId, session: session);
    if (character == null) {
      throw Exception('캐릭터를 찾을 수 없습니다: ${request.characterId}');
    }

    // 소셜 ID로 기존 사용자 확인
    final existingUser = await getUserBySocialId(request.socialId, session: session);
    if (existingUser != null) {
      throw Exception('이미 존재하는 소셜 ID입니다: ${request.socialId}');
    }

    final user = User(
      nickname: request.nickname,
      socialId: request.socialId,
      agreedToTerms: request.agreedToTerms,
      characterId: character.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await user.save(session);
    return user;
  }

  /// 사용자 정보 업데이트
  Future<User> updateUser(UpdateUserParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final user = await getUserById(params.userId, session: session);
    if (user == null) {
      throw Exception('사용자를 찾을 수 없습니다: ${params.userId}');
    }

    if (params.nickname != null) {
      user.nickname = params.nickname!;
    }

    if (params.characterId != null) {
      // 캐릭터 확인
      final character = await _characterService.getCharacterById(params.characterId!, session: session);
      if (character == null) {
        throw Exception('캐릭터를 찾을 수 없습니다: ${params.characterId}');
      }
      user.characterId = params.characterId!;
    }

    user.updatedAt = DateTime.now();
    await user.save(session);
    return user;
  }

  /// 사용자 삭제
  Future<void> deleteUser(int userId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final user = await getUserById(userId, session: session);
    if (user == null) {
      throw Exception('사용자를 찾을 수 없습니다: $userId');
    }

    await User.deleteRow(session, user);
  }

  /// 사용자 응답 DTO 생성
  UserResponse createUserResponse(User user) {
    return UserResponse(
      id: user.id!,
      nickname: user.nickname,
      characterId: user.characterId,
      createdAt: user.createdAt,
    );
  }
}