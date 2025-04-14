// import 'package:rubbit_server_server/src/generated/protocol.dart';
// import 'package:serverpod/serverpod.dart';
//
// class CharacterEndpoint extends Endpoint {
//   Future<List<CharacterResponse>> listAllCharacters(Session session) async {
//     var characters = await session.services.characterService.getAllCharacters();
//
//     return characters
//         .map((character) => CharacterResponse(
//               id: character.id!,
//               name: character.name,
//             ))
//         .toList();
//   }
//
//   Future<CharacterResponse> getCharacterById(Session session, int id) async {
//     var character =
//         await session.services.characterService.getCharacterById(id);
//     if (character == null) {
//       throw NotFoundException('Character with id $id not found');
//     }
//
//     return CharacterResponse(
//       id: character.id!,
//       name: character.name,
//     );
//   }
//
//   Future<CharacterResponse> createNewCharacter(
//       Session session, CharacterRequest request) async {
//     var character =
//         await session.services.characterService.createCharacter(request.name);
//
//     return CharacterResponse(
//       id: character.id!,
//       name: character.name,
//     );
//   }
//
//   Future<CharacterResponse> updateCharacterInfo(
//       Session session, UpdateCharacterParams params) async {
//     var character =
//         await session.services.characterService.getCharacterById(params.id);
//     if (character == null) {
//       throw NotFoundException('Character with id ${params.id} not found');
//     }
//
//     character.name = params.request.name;
//
//     var updatedCharacter =
//         await session.services.characterService.updateCharacter(character);
//     if (updatedCharacter == null) {
//       throw InternalServerError('Failed to update character');
//     }
//
//     return CharacterResponse(
//       id: updatedCharacter.id!,
//       name: updatedCharacter.name,
//     );
//   }
//
//   Future<bool> deleteCharacter(Session session, int id) async {
//     return await session.services.characterService.deleteCharacter(id);
//   }
// }
//
// class UpdateCharacterParams {
//   final int id;
//   final CharacterRequest request;
//
//   UpdateCharacterParams({required this.id, required this.request});
// }
