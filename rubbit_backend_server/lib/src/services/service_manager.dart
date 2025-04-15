import 'package:serverpod/serverpod.dart';
import 'user_service.dart';
import 'character_service.dart';
import 'emotion_service.dart';
import 'diary_service.dart';
import 'diary_advice_service.dart';

/// 애플리케이션의 모든 서비스를 관리하는 클래스
class ServiceManager {
  late final UserService userService;
  late final CharacterService characterService;
  late final EmotionService emotionService;
  late final DiaryService diaryService;
  late final DiaryAdviceService diaryAdviceService;

  /// 서비스 매니저 싱글톤 인스턴스
  static final ServiceManager _instance = ServiceManager._internal();

  /// 서비스 매니저의 팩토리 생성자
  factory ServiceManager() {
    return _instance;
  }

  /// 서비스 매니저의 내부 생성자
  ServiceManager._internal();

  /// 모든 서비스를 초기화하는 메서드
  void initialize(ServerpodSessionManager sessionManager) {
    characterService = CharacterService(sessionManager);
    emotionService = EmotionService(sessionManager);
    userService = UserService(sessionManager, characterService);
    diaryService = DiaryService(sessionManager, userService, emotionService);
    diaryAdviceService = DiaryAdviceService(sessionManager, diaryService);
  }
}