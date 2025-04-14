import 'package:rubbit_server_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DiaryAdviceEndpoint extends Endpoint {
  // 일기에 대한 조언 조회
  Future<DiaryAdviceResponse?> getAdviceForDiary(Session session, int diaryId) async {
    var advice = await session.services.diaryAdviceService.getAdviceByDiaryId(diaryId);
    if (advice == null) {
      return null;
    }

    return DiaryAdviceResponse(
      id: advice.id!,
      diaryId: advice.diaryId,
      encouragement: advice.encouragement,
      fortune: advice.fortune,
      createdAt: advice.createdAt,
      updatedAt: advice.updatedAt,
    );
  }

  // 일기 조언 생성 또는 업데이트
  Future<DiaryAdviceResponse> saveAdviceForDiary(Session session, DiaryAdviceRequest request) async {
    // 일기 존재 확인 및 권한 체크
    var diary = await session.services.diaryService.getDiaryById(request.diaryId);
    if (diary == null) {
      throw NotFoundException('Diary not found');
    }

    var advice = await session.services.diaryAdviceService.createOrUpdateAdvice(
      diaryId: request.diaryId,
      encouragement: request.encouragement,
      fortune: request.fortune,
    );

    return DiaryAdviceResponse(
      id: advice.id!,
      diaryId: advice.diaryId,
      encouragement: advice.encouragement,
      fortune: advice.fortune,
      createdAt: advice.createdAt,
      updatedAt: advice.updatedAt,
    );
  }

  // 일기 조언 자동 생성
  Future<DiaryAdviceResponse> generateAdviceForDiary(Session session, int diaryId) async {
    // 일기 존재 확인
    var diary = await session.services.diaryService.getDiaryById(diaryId);
    if (diary == null) {
      throw NotFoundException('Diary not found');
    }

    var advice = await session.services.diaryAdviceService.generateAdvice(diaryId);

    return DiaryAdviceResponse(
      id: advice.id!,
      diaryId: advice.diaryId,
      encouragement: advice.encouragement,
      fortune: advice.fortune,
      createdAt: advice.createdAt,
      updatedAt: advice.updatedAt,
    );
  }

  // 조언 삭제
  Future<bool> deleteAdvice(Session session, int id) async {
    return await session.services.diaryAdviceService.deleteAdvice(id);
  }
}