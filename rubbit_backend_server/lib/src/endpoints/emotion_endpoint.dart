import 'package:rubbit_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class EmotionEndpoint extends Endpoint {
  // 모든 감정 목록 조회
  Future<List<EmotionResponse>> listAllEmotions(Session session) async {
    var emotions = await session.services.emotionService.getAllEmotions();

    return emotions.map((emotion) => EmotionResponse(
      id: emotion.id!,
      name: emotion.name,
      createdAt: emotion.createdAt,
      updatedAt: emotion.updatedAt,
    )).toList();
  }

  // 특정 감정 조회
  Future<EmotionResponse> getEmotionById(Session session, int id) async {
    var emotion = await session.services.emotionService.getEmotionById(id);
    if (emotion == null) {
      throw NotFoundException('Emotion with id $id not found');
    }

    return EmotionResponse(
      id: emotion.id!,
      name: emotion.name,
      createdAt: emotion.createdAt,
      updatedAt: emotion.updatedAt,
    );
  }

  // 새 감정 생성
  Future<EmotionResponse> createNewEmotion(Session session, EmotionRequest request) async {
    var emotion = await session.services.emotionService.createEmotion(request.name);

    return EmotionResponse(
      id: emotion.id!,
      name: emotion.name,
      createdAt: emotion.createdAt,
      updatedAt: emotion.updatedAt,
    );
  }

  // 감정 정보 업데이트
  Future<EmotionResponse> updateEmotionInfo(Session session, UpdateEmotionParams params) async {
    var emotion = await session.services.emotionService.getEmotionById(params.id);
    if (emotion == null) {
      throw NotFoundException('Emotion with id ${params.id} not found');
    }

    emotion.name = params.request.name;

    var updatedEmotion = await session.services.emotionService.updateEmotion(emotion);
    if (updatedEmotion == null) {
      throw InternalServerError('Failed to update emotion');
    }

    return EmotionResponse(
      id: updatedEmotion.id!,
      name: updatedEmotion.name,
      createdAt: updatedEmotion.createdAt,
      updatedAt: updatedEmotion.updatedAt,
    );
  }

  // 감정 삭제
  Future<bool> deleteEmotion(Session session, int id) async {
    return await session.services.emotionService.deleteEmotion(id);
  }
}

// 업데이트 파라미터 클래스
class UpdateEmotionParams {
  final int id;
  final EmotionRequest request;

  UpdateEmotionParams({required this.id, required this.request});
}