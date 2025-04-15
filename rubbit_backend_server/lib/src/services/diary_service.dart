import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'user_service.dart';
import 'emotion_service.dart';

/// 일기 관련 비즈니스 로직을 처리하는 서비스 클래스
class DiaryService {
  final ServerpodSessionManager _sessionManager;
  final UserService _userService;
  final EmotionService _emotionService;

  /// 생성자
  DiaryService(this._sessionManager, this._userService, this._emotionService);

  /// 일기 ID로 일기 조회
  Future<Diary?> getDiaryById(int diaryId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await Diary.findById(session, diaryId);
  }

  /// 새 일기 생성
  Future<Diary> createDiary(DiaryRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 사용자 확인
    final user = await _userService.getUserById(request.userId, session: session);
    if (user == null) {
      throw Exception('사용자를 찾을 수 없습니다: ${request.userId}');
    }

    // 감정 확인
    final emotion = await _emotionService.getEmotionById(request.emotionId, session: session);
    if (emotion == null) {
      throw Exception('감정을 찾을 수 없습니다: ${request.emotionId}');
    }

    final diary = Diary(
      userId: user.id!,
      content: request.content,
      emotionId: emotion.id!,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await diary.save(session);
    return diary;
  }

  /// 일기 정보 업데이트
  Future<Diary> updateDiary(UpdateDiaryParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final diary = await getDiaryById(params.diaryId, session: session);
    if (diary == null) {
      throw Exception('일기를 찾을 수 없습니다: ${params.diaryId}');
    }

    // 사용자 권한 확인 (실제 구현에서는 여기에 권한 체크 로직 추가)

    if (params.content != null) {
      diary.content = params.content!;
    }

    if (params.emotionId != null) {
      // 감정 확인
      final emotion = await _emotionService.getEmotionById(params.emotionId!, session: session);
      if (emotion == null) {
        throw Exception('감정을 찾을 수 없습니다: ${params.emotionId}');
      }
      diary.emotionId = params.emotionId!;
    }

    diary.updatedAt = DateTime.now();
    await diary.save(session);
    return diary;
  }

  /// 일기 삭제
  Future<void> deleteDiary(DeleteDiaryParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final diary = await getDiaryById(params.diaryId, session: session);
    if (diary == null) {
      throw Exception('일기를 찾을 수 없습니다: ${params.diaryId}');
    }

    // 사용자 권한 확인 (실제 구현에서는 여기에 권한 체크 로직 추가)

    // 먼저 관련된 일기 조언 삭제
    await session.db.delete<DiaryAdvice>(
      where: (a) => a.diaryId.equals(params.diaryId),
    );

    await Diary.deleteRow(session, diary);
  }

  /// 특정 사용자의 모든 일기 조회
  Future<List<Diary>> getUserDiaries(UserDiariesParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final user = await _userService.getUserById(params.userId, session: session);
    if (user == null) {
      throw Exception('사용자를 찾을 수 없습니다: ${params.userId}');
    }

    return await Diary.find(
      session,
      where: (d) => d.userId.equals(params.userId),
      orderBy: (d) => d.createdAt,
      orderDescending: true,
      limit: params.limit,
      offset: params.offset,
    );
  }

  /// 일기 검색
  Future<List<Diary>> searchDiaries(SearchDiariesParams params, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final user = await _userService.getUserById(params.userId, session: session);
    if (user == null) {
      throw Exception('사용자를 찾을 수 없습니다: ${params.userId}');
    }

    var query = Diary.db.where((d) => d.userId.equals(params.userId));

    // 감정 필터링
    if (params.emotionId != null) {
      query = query.and((d) => d.emotionId.equals(params.emotionId!));
    }

    // 날짜 범위 필터링
    if (params.startDate != null) {
      query = query.and((d) => d.createdAt.greaterThanOrEquals(params.startDate!));
    }

    if (params.endDate != null) {
      query = query.and((d) => d.createdAt.lessThanOrEquals(params.endDate!));
    }

    // 키워드 검색
    if (params.keyword != null && params.keyword!.isNotEmpty) {
      query = query.and((d) => d.content.ilike('%${params.keyword}%'));
    }

    return await query.find(
      session,
      orderBy: (d) => d.createdAt,
      orderDescending: true,
      limit: params.limit,
      offset: params.offset,
    );
  }

  /// 일기와 관련 정보(사용자, 감정, 조언)를 포함한 전체 데이터 조회
  Future<DiaryResponse> createDiaryResponse(Diary diary, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final user = await _userService.getUserById(diary.userId, session: session);
    final emotion = await _emotionService.getEmotionById(diary.emotionId, session: session);

    // 일기 조언 조회
    final advices = await DiaryAdvice.find(
      session,
      where: (a) => a.diaryId.equals(diary.id!),
    );

    DiaryAdvice? advice;
    if (advices.isNotEmpty) {
      advice = advices.first;
    }

    return DiaryResponse(
      id: diary.id!,
      userId: diary.userId,
      userNickname: user?.nickname ?? '알 수 없음',
      content: diary.content,
      emotionId: diary.emotionId,
      emotionName: emotion?.name ?? '알 수 없음',
      encouragement: advice?.encouragement,
      fortune: advice?.fortune,
      createdAt: diary.createdAt,
      updatedAt: diary.updatedAt,
    );
  }
}