import { Injectable, UnauthorizedException } from '@nestjs/common';
import { AppleProviderService } from '../data/remote/apple-provider.service';
import { KakaoProviderService } from '../data/remote/kakao-provider.service';
import { CognitoProvider } from '../data/remote/cognito.provider';
import { UserRepository } from '../data/local/repositories/user.repository';

@Injectable()
export class AuthService {
  constructor(
    private readonly appleProvider: AppleProviderService,
    private readonly kakaoProvider: KakaoProviderService,
    private readonly cognitoProvider: CognitoProvider,
    private readonly userRepository: UserRepository,
  ) {}

  /**
   * 카카오 로그인
   */
  public async loginWithKakao(authCode: string): Promise<{
    accessToken: string;
    expiresIn: number;
    userUuid: string;
  }> {
    // 1) 카카오 토큰 획득
    const accessToken = await this.kakaoProvider.getAccessToken(authCode);
    const socialId = await this.kakaoProvider.getSocialId(accessToken);

    // 2) 유저 조회 or 생성
    let user = await this.userRepository.findBySocialId(socialId);
    if (!user) {
      user = await this.userRepository.createUserWithSocialId(socialId);
    }

    // 3) 카카오 토큰 → Cognito 소셜 로그인
    const cognitoResult: CognitoAuthResult =
      await this.cognitoProvider.authenticateKakao(accessToken);

    // 4) 최종적으로 필요한 정보만 리턴
    return {
      accessToken: cognitoResult.AccessToken,
      expiresIn: cognitoResult.ExpiresIn,
      userUuid: user.id, // DB상 uuid
    };
  }

  /**
   * 애플 로그인
   */
  public async loginWithApple(authCode: string): Promise<{
    accessToken: string;
    expiresIn: number;
    userUuid: string;
  }> {
    // 1) 애플 토큰 획득
    const accessToken = await this.appleProvider.getAccessToken(authCode);
    const socialId = await this.appleProvider.getSocialId();

    // 2) 유저 조회 or 생성
    let user = await this.userRepository.findBySocialId(socialId);
    if (!user) {
      user = await this.userRepository.createUserWithSocialId(socialId);
    }

    // 3) Apple id_token → Cognito
    const idToken = this.appleProvider['idToken'];
    if (!idToken) {
      throw new UnauthorizedException('Apple ID token not found');
    }
    const cognitoResult: CognitoAuthResult =
      await this.cognitoProvider.authenticateApple(idToken);

    // 4) IdToken은 반환하지 않음, AccessToken만 사용
    return {
      accessToken: cognitoResult.AccessToken,
      expiresIn: cognitoResult.ExpiresIn,
      userUuid: user.id,
    };
  }

  public async verifyCognitoToken(token: string): Promise<DecodedJwt> {
    return this.cognitoProvider.verifyToken(token);
  }

  public async refreshCognitoToken(refreshToken: string): Promise<{
    accessToken: string;
    expiresIn: number;
    refreshToken: string;
  }> {
    const result = await this.cognitoProvider.refreshToken(refreshToken);
    return {
      accessToken: result.AccessToken,
      expiresIn: result.ExpiresIn,
      refreshToken: result.RefreshToken,
    };
  }
}
