import 'package:rubbit_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class UserEndpoint extends Endpoint {
  Future<UserResponse> getUserById(Session session, int id) async {
    var user = await session.services.userService.getUserById(id);
    if (user == null) {
      throw NotFoundException('User with id $id not found');
    }

    var character = await session.services.characterService
        .getCharacterById(user.characterId);

    return UserResponse(
      id: user.id!,
      nickname: user.nickname,
      socialId: user.socialId,
      agreedToTerms: user.agreedToTerms,
      characterId: user.characterId,
      characterName: character?.name,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  Future<UserResponse> socialLogin(Session session, UserRequest request) async {
    var user =
        await session.services.userService.getUserBySocialId(request.socialId);

    if (user == null) {
      user = await session.services.userService.createUser(
        nickname: request.nickname,
        socialId: request.socialId,
        agreedToTerms: request.agreedToTerms,
        characterId: request.characterId,
      );
    }

    var character = await session.services.characterService
        .getCharacterById(user.characterId);

    return UserResponse(
      id: user.id!,
      nickname: user.nickname,
      socialId: user.socialId,
      agreedToTerms: user.agreedToTerms,
      characterId: user.characterId,
      characterName: character?.name,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
  }

  Future<UserResponse> updateUserInfo(
      Session session, UpdateUserParams params) async {
    var user = await session.services.userService.getUserById(params.id);
    if (user == null) {
      throw NotFoundException('User with id ${params.id} not found');
    }

    var character = await session.services.characterService
        .getCharacterById(params.request.characterId);
    if (character == null) {
      throw ValidationException('Character not found');
    }

    user.nickname = params.request.nickname;
    user.agreedToTerms = params.request.agreedToTerms;
    user.characterId = params.request.characterId;

    var updatedUser = await session.services.userService.updateUser(user);
    if (updatedUser == null) {
      throw InternalServerError('Failed to update user');
    }

    return UserResponse(
      id: updatedUser.id!,
      nickname: updatedUser.nickname,
      socialId: updatedUser.socialId,
      agreedToTerms: updatedUser.agreedToTerms,
      characterId: updatedUser.characterId,
      characterName: character.name,
      createdAt: updatedUser.createdAt,
      updatedAt: updatedUser.updatedAt,
    );
  }

  Future<bool> deleteUserAccount(Session session, int id) async {
    return await session.services.userService.deleteUser(id);
  }
}

class UpdateUserParams {
  final int id;
  final UserRequest request;

  UpdateUserParams({required this.id, required this.request});
}
