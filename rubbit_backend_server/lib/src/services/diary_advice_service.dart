import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import 'diary_service.dart';

/// 일기 조언 관련 비즈니스 로직을 처리하는 서비스 클래스
class DiaryAdviceService {
  final ServerpodSessionManager _sessionManager;
  final DiaryService _diaryService;

  /// 생성자
  DiaryAdviceService(this._sessionManager, this._diaryService);

  /// 일기 조언 ID로 조회
  Future<DiaryAdvice?> getAdviceById(int adviceId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    return await DiaryAdvice.findById(session, adviceId);
  }

  /// 일기 ID로 조언 조회
  Future<DiaryAdvice?> getAdviceByDiaryId(int diaryId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final advices = await DiaryAdvice.find(
      session,
      where: (a) => a.diaryId.equals(diaryId),
    );

    return advices.isNotEmpty ? advices.first : null;
  }

  /// 새 일기 조언 생성
  Future<DiaryAdvice> createDiaryAdvice(DiaryAdviceRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 일기 확인
    final diary = await _diaryService.getDiaryById(request.diaryId, session: session);
    if (diary == null) {
      throw Exception('일기를 찾을 수 없습니다: ${request.diaryId}');
    }

    // 이미 존재하는 조언 확인
    final existingAdvice = await getAdviceByDiaryId(request.diaryId, session: session);
    if (existingAdvice != null) {
      throw Exception('이 일기에 대한 조언이 이미 존재합니다.');
    }

    final advice = DiaryAdvice(
      diaryId: diary.id!,
      encouragement: request.encouragement,
      fortune: request.fortune,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await advice.save(session);
    return advice;
  }

  /// 일기 조언 업데이트
  Future<DiaryAdvice> updateDiaryAdvice(int adviceId, DiaryAdviceRequest request, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final advice = await getAdviceById(adviceId, session: session);
    if (advice == null) {
      throw Exception('일기 조언을 찾을 수 없습니다: $adviceId');
    }

    // 일기 확인
    if (advice.diaryId != request.diaryId) {
      final diary = await _diaryService.getDiaryById(request.diaryId, session: session);
      if (diary == null) {
        throw Exception('일기를 찾을 수 없습니다: ${request.diaryId}');
      }
      advice.diaryId = request.diaryId;
    }

    advice.encouragement = request.encouragement;
    advice.fortune = request.fortune;
    advice.updatedAt = DateTime.now();

    await advice.save(session);
    return advice;
  }

  /// 일기 조언 삭제
  Future<void> deleteDiaryAdvice(int adviceId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final advice = await getAdviceById(adviceId, session: session);
    if (advice == null) {
      throw Exception('일기 조언을 찾을 수 없습니다: $adviceId');
    }

    await DiaryAdvice.deleteRow(session, advice);
  }

  /// 일기 ID로 조언 삭제
  Future<void> deleteDiaryAdviceByDiaryId(int diaryId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    final advice = await getAdviceByDiaryId(diaryId, session: session);
    if (advice == null) {
      throw Exception('일기에 대한 조언을 찾을 수 없습니다: $diaryId');
    }

    await DiaryAdvice.deleteRow(session, advice);
  }

  /// 일기 조언 응답 DTO 생성
  DiaryAdviceResponse createDiaryAdviceResponse(DiaryAdvice advice) {
    return DiaryAdviceResponse(
      id: advice.id!,
      diaryId: advice.diaryId,
      encouragement: advice.encouragement,
      fortune: advice.fortune,
      createdAt: advice.createdAt,
      updatedAt: advice.updatedAt,
    );
  }

  /// 여러 일기 ID에 대한 일기 조언 조회
  Future<Map<int, DiaryAdvice>> getAdvicesByDiaryIds(List<int> diaryIds, {Session? session}) async {
    if (diaryIds.isEmpty) {
      return {};
    }

    session ??= await _sessionManager.getSession();

    final advices = await DiaryAdvice.find(
      session,
      where: (a) => a.diaryId.inList(diaryIds),
    );

    return {for (var advice in advices) advice.diaryId: advice};
  }

  /// AI를 활용한 일기 조언 생성
  Future<DiaryAdvice> generateAdviceForDiary(int diaryId, {Session? session}) async {
    session ??= await _sessionManager.getSession();

    // 일기 확인
    final diary = await _diaryService.getDiaryById(diaryId, session: session);
    if (diary == null) {
      throw Exception('일기를 찾을 수 없습니다: $diaryId');
    }

    // 이미 존재하는 조언 확인
    final existingAdvice = await getAdviceByDiaryId(diaryId, session: session);
    if (existingAdvice != null) {
      return existingAdvice;
    }

    // 일기 내용 기반 조언과 포춘 쿠키 메시지 생성
    // 실제 구현에서는 여기에 AI 서비스와의 통합 로직이 있을 수 있습니다.
    final String encouragementMessage = _generateEncouragement(diary.content);
    final String fortuneMessage = _generateFortune();

    // 새 조언 저장
    final advice = DiaryAdvice(
      diaryId: diary.id!,
      encouragement: encouragementMessage,
      fortune: fortuneMessage,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await advice.save(session);
    return advice;
  }

  /// 일기 내용 기반 격려 메시지 생성 (실제 구현에서는 AI 모델 활용)
  String _generateEncouragement(String diaryContent) {
    // 실제 구현에서는 여기서 AI 서비스를 호출하거나 자연어 처리를 수행할 수 있습니다.
    // 이 예시에서는 간단한 응답을 반환합니다.
    return '오늘도 당신의 하루를 기록해주셔서 감사합니다. 매일 기록을 통해 자신의 감정을 돌아보는 것은 큰 성장의 기회가 됩니다. 내일은 더 좋은 하루가 될 것입니다.';
  }

  /// 운세 메시지 생성 (실제 구현에서는 다양한 메시지 풀에서 선택)
  String _generateFortune() {
    // 실제 구현에서는 여기서 다양한 메시지 풀에서 랜덤하게 선택할 수 있습니다.
    final fortunes = [
      '오늘의 작은 노력이 내일의 큰 성취로 이어질 것입니다.',
      '당신을 위한 새로운 기회가 곧 찾아옵니다.',
      '조금씩 나아가는 것도 큰 진보의 시작입니다.',
      '오늘 당신이 느끼는 감정은 당신의 성장을 돕는 소중한 선물입니다.',
      '내면의 목소리에 귀 기울이면 답을 찾게 될 것입니다.',
    ];

    return fortunes[DateTime.now().millisecondsSinceEpoch % fortunes.length];
  }
}