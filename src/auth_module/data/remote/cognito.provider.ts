import { Injectable, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import * as AWS from 'aws-sdk';
import * as jwt from 'jsonwebtoken';
import * as jwksClient from 'jwks-rsa';

@Injectable()
export class CognitoProvider {
  private readonly cognito: AWS.CognitoIdentityServiceProvider;
  private readonly clientId: string;
  private readonly userPoolId: string;
  private readonly jwksUrl: string;
  private readonly jwks: jwksClient.JwksClient;

  constructor(private readonly configService: ConfigService) {
    this.cognito = new AWS.CognitoIdentityServiceProvider({
      region: this.configService.get<string>('AWS_REGION'),
    });

    this.clientId = this.configService.get<string>('COGNITO_CLIENT_ID');
    this.userPoolId = this.configService.get<string>('COGNITO_USER_POOL_ID');

    // Cognito의 JWKS URL 설정 (토큰 서명 검증에 필요)
    this.jwksUrl = `https://cognito-idp.${this.configService.get<string>(
      'AWS_REGION',
    )}.amazonaws.com/${this.userPoolId}/.well-known/jwks.json`;

    this.jwks = jwksClient({
      jwksUri: this.jwksUrl,
    });
  }

  /**
   * 카카오 소셜 로그인
   */
  async authenticateKakao(
    kakaoAccessToken: string,
  ): Promise<CognitoAuthResult> {
    return this.authenticateWithIdp(kakaoAccessToken);
  }

  /**
   * 애플 소셜 로그인
   */
  async authenticateApple(appleIdToken: string): Promise<CognitoAuthResult> {
    return this.authenticateWithIdp(appleIdToken);
  }

  /**
   * Cognito에서 발급한 JWT 토큰 검증
   */
  async verifyToken(token: string): Promise<DecodedJwt> {
    try {
      const decodedHeader = jwt.decode(token, { complete: true });
      if (!decodedHeader || typeof decodedHeader !== 'object') {
        throw new UnauthorizedException('Invalid JWT token format');
      }

      const kid = decodedHeader.header.kid;
      const key = await this.jwks.getSigningKey(kid);
      const publicKey = key.getPublicKey();

      return jwt.verify(token, publicKey, {
        algorithms: ['RS256'],
      }) as DecodedJwt;
    } catch (error) {
      throw new UnauthorizedException('Invalid token', error.message);
    }
  }

  /**
   * Cognito initiateAuth() 호출
   */
  private async authenticateWithIdp(token: string): Promise<CognitoAuthResult> {
    const params: AWS.CognitoIdentityServiceProvider.InitiateAuthRequest = {
      AuthFlow: 'USER_PASSWORD_AUTH',
      ClientId: this.clientId,
      AuthParameters: {
        IDP_TOKEN: token,
      },
    };

    try {
      const response = await this.cognito.initiateAuth(params).promise();
      if (!response.AuthenticationResult) {
        throw new UnauthorizedException(
          'Authentication failed, no result returned',
        );
      }

      return {
        AccessToken: response.AuthenticationResult.AccessToken,
        IdToken: response.AuthenticationResult.IdToken,
        RefreshToken: response.AuthenticationResult.RefreshToken,
        ExpiresIn: response.AuthenticationResult.ExpiresIn,
        TokenType: response.AuthenticationResult.TokenType,
      };
    } catch (error) {
      throw new UnauthorizedException(
        'Cognito authentication failed',
        error.message,
      );
    }
  }

  async refreshToken(refreshToken: string): Promise<CognitoAuthResult> {
    const params: AWS.CognitoIdentityServiceProvider.InitiateAuthRequest = {
      AuthFlow: 'REFRESH_TOKEN_AUTH',
      ClientId: this.clientId,
      AuthParameters: {
        REFRESH_TOKEN: refreshToken,
      },
    };

    try {
      const response = await this.cognito.initiateAuth(params).promise();
      if (!response.AuthenticationResult) {
        throw new UnauthorizedException('No AuthenticationResult returned');
      }

      return {
        AccessToken: response.AuthenticationResult.AccessToken,
        IdToken: response.AuthenticationResult.IdToken,
        RefreshToken:
          response.AuthenticationResult.RefreshToken ?? refreshToken,
        ExpiresIn: response.AuthenticationResult.ExpiresIn,
        TokenType: response.AuthenticationResult.TokenType,
      };
    } catch (error) {
      throw new UnauthorizedException('Cognito refresh failed', error.message);
    }
  }
}
