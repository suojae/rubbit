import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// 감정 관련 비즈니스 로직을 처리하는 서비스 클래스
class EmotionService {
  final ServerpodSessionManager _sessionManager;

  /// 생성자
  EmotionService(this._sessionManager);

  /// 모든 감정 조회
  Future<List<Emotion>> getAllEmotions({Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await Emotion.find(session);
  }

  /// 감정 ID로 감정 조회
  Future<Emotion?> getEmotionById(int emotionId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await Emotion.findById(session, emotionId);
  }

  /// 감정 이름으로 감정 조회
  Future<Emotion?> getEmotionByName(String name, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final emotions = await Emotion.find(
      session,
      where: (e) => e.name.equals(name),
    );

    return emotions.isNotEmpty ? emotions.first : null;
  }

  /// 새 감정 생성
  Future<Emotion> createEmotion(EmotionRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 이름 중복 확인
    final existingEmotion = await getEmotionByName(request.name, session: session);
    if (existingEmotion != null) {
      throw Exception('이미 존재하는 감정 이름입니다: ${request.name}');
    }

    final emotion = Emotion(
      name: request.name,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await emotion.save(session);
    return emotion;
  }

  /// 감정 정보 업데이트
  Future<Emotion> updateEmotion(UpdateEmotionParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final emotion = await getEmotionById(params.emotionId, session: session);
    if (emotion == null) {
      throw Exception('감정을 찾을 수 없습니다: ${params.emotionId}');
    }

    if (params.name != null) {
      // 이름 중복 확인
      final existingEmotion = await getEmotionByName(params.name!, session: session);
      if (existingEmotion != null && existingEmotion.id != emotion.id) {
        throw Exception('이미 존재하는 감정 이름입니다: ${params.name}');
      }

      emotion.name = params.name!;
      emotion.updatedAt = DateTime.now();
    }

    await emotion.save(session);
    return emotion;
  }

  /// 감정 삭제
  Future<void> deleteEmotion(int emotionId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final emotion = await getEmotionById(emotionId, session: session);
    if (emotion == null) {
      throw Exception('감정을 찾을 수 없습니다: $emotionId');
    }

    // 해당 감정을 사용하는 일기 확인
    final diaries = await Diary.find(
      session,
      where: (d) => d.emotionId.equals(emotionId),
    );

    if (diaries.isNotEmpty) {
      throw Exception('이 감정을 사용하는 일기가 있어 삭제할 수 없습니다.');
    }

    await Emotion.deleteRow(session, emotion);
  }

  /// 특정 감정과 관련된 모든 일기 조회
  Future<List<Diary>> getEmotionDiaries(EmotionDiariesParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final emotion = await getEmotionById(params.emotionId, session: session);
    if (emotion == null) {
      throw Exception('감정을 찾을 수 없습니다: ${params.emotionId}');
    }

    return await Diary.find(
      session,
      where: (d) => d.emotionId.equals(params.emotionId),
      orderBy: (d) => d.createdAt,
      orderDescending: true,
      limit: params.limit,
      offset: params.offset,
    );
  }

  /// 감정 응답 DTO 생성
  EmotionResponse createEmotionResponse(Emotion emotion) {
    return EmotionResponse(
      id: emotion.id!,
      name: emotion.name,
      createdAt: emotion.createdAt,
    );
  }
}