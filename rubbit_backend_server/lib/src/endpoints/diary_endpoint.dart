import 'package:rubbit_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DiaryEndpoint extends Endpoint {
  // 사용자의 모든 일기 조회
  Future<List<DiaryResponse>> listUserDiaries(
      Session session,
      UserDiariesParams params
      ) async {
    var diaries = await session.services.diaryService.getDiariesByUserId(
        params.userId,
        limit: params.limit,
        offset: params.offset
    );

    return await _mapDiariesToResponses(session, diaries);
  }

  // 특정 일기 조회
  Future<DiaryResponse> getDiaryById(Session session, int id) async {
    var diary = await session.services.diaryService.getDiaryById(id);
    if (diary == null) {
      throw NotFoundException('Diary with id $id not found');
    }

    return await _mapDiaryToResponse(session, diary);
  }

  // 특정 감정의 일기 조회
  Future<List<DiaryResponse>> listUserDiariesByEmotion(
      Session session,
      EmotionDiariesParams params
      ) async {
    var diaries = await session.services.diaryService.getDiariesByEmotionId(
        params.userId,
        params.emotionId,
        limit: params.limit,
        offset: params.offset
    );

    return await _mapDiariesToResponses(session, diaries);
  }

  // 새 일기 작성
  Future<DiaryResponse> createNewDiary(Session session, DiaryRequest request) async {
    var diary = await session.services.diaryService.createDiary(
      userId: request.userId,
      content: request.content,
      emotionId: request.emotionId,
    );

    // 자동으로 조언 생성
    await session.services.diaryAdviceService.generateAdvice(diary.id!);

    return await _mapDiaryToResponse(session, diary);
  }

  // 일기 내용 업데이트
  Future<DiaryResponse> updateDiaryContent(Session session, UpdateDiaryParams params) async {
    var diary = await session.services.diaryService.getDiaryById(params.id);
    if (diary == null) {
      throw NotFoundException('Diary with id ${params.id} not found');
    }

    // 소유자 확인
    if (diary.userId != params.request.userId) {
      throw UnauthorizedException('You are not authorized to update this diary');
    }

    diary.content = params.request.content;
    diary.emotionId = params.request.emotionId;

    var updatedDiary = await session.services.diaryService.updateDiary(diary);
    if (updatedDiary == null) {
      throw InternalServerError('Failed to update diary');
    }

    // 감정이 바뀌었다면 조언도 새로 생성
    if (diary.emotionId != params.request.emotionId) {
      await session.services.diaryAdviceService.generateAdvice(updatedDiary.id!);
    }

    return await _mapDiaryToResponse(session, updatedDiary);
  }

  // 일기 삭제
  Future<bool> deleteDiary(Session session, DeleteDiaryParams params) async {
    var diary = await session.services.diaryService.getDiaryById(params.id);
    if (diary == null) {
      throw NotFoundException('Diary with id ${params.id} not found');
    }

    // 소유자 확인
    if (diary.userId != params.userId) {
      throw UnauthorizedException('You are not authorized to delete this diary');
    }

    return await session.services.diaryService.deleteDiary(params.id);
  }

  // 일기 검색
  Future<List<DiaryResponse>> searchUserDiaries(
      Session session,
      SearchDiariesParams params
      ) async {
    var diaries = await session.services.diaryService.searchDiaries(
        params.userId,
        params.query,
        limit: params.limit,
        offset: params.offset
    );

    return await _mapDiariesToResponses(session, diaries);
  }

  // 사용자 일기 통계 조회
  Future<Map<String, dynamic>> getUserDiaryStats(Session session, int userId) async {
    return await session.services.diaryService.getDiaryStatsByUserId(userId);
  }

  // 헬퍼 메서드 - Diary 엔티티를 DiaryResponse로 변환
  Future<DiaryResponse> _mapDiaryToResponse(Session session, Diary diary) async {
    var emotion = await session.services.emotionService.getEmotionById(diary.emotionId);
    var advice = await session.services.diaryAdviceService.getAdviceByDiaryId(diary.id!);

    DiaryAdviceResponse? adviceResponse;
    if (advice != null) {
      adviceResponse = DiaryAdviceResponse(
        id: advice.id!,
        diaryId: advice.diaryId,
        encouragement: advice.encouragement,
        fortune: advice.fortune,
        createdAt: advice.createdAt,
        updatedAt: advice.updatedAt,
      );
    }

    return DiaryResponse(
      id: diary.id!,
      userId: diary.userId,
      content: diary.content,
      emotionId: diary.emotionId,
      emotionName: emotion?.name,
      createdAt: diary.createdAt,
      updatedAt: diary.updatedAt,
      advice: adviceResponse,
    );
  }

  // 헬퍼 메서드 - Diary 리스트를 DiaryResponse 리스트로 변환
  Future<List<DiaryResponse>> _mapDiariesToResponses(Session session, List<Diary> diaries) async {
    List<DiaryResponse> responses = [];

    for (var diary in diaries) {
      responses.add(await _mapDiaryToResponse(session, diary));
    }

    return responses;
  }
}

// 파라미터 클래스들
class UserDiariesParams {
  final int userId;
  final int? limit;
  final int? offset;

  UserDiariesParams({required this.userId, this.limit, this.offset});
}

class EmotionDiariesParams {
  final int userId;
  final int emotionId;
  final int? limit;
  final int? offset;

  EmotionDiariesParams({required this.userId, required this.emotionId, this.limit, this.offset});
}

class UpdateDiaryParams {
  final int id;
  final DiaryRequest request;

  UpdateDiaryParams({required this.id, required this.request});
}

class DeleteDiaryParams {
  final int id;
  final int userId;

  DeleteDiaryParams({required this.id, required this.userId});
}

class SearchDiariesParams {
  final int userId;
  final String query;
  final int? limit;
  final int? offset;

  SearchDiariesParams({required this.userId, required this.query, this.limit, this.offset});
}