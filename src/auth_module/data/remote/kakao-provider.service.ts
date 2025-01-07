import { Injectable } from '@nestjs/common';
import { AxiosResponse } from 'axios';
import { SocialLoginProvider } from './social-login-provider.interface';
import { HttpService } from '@nestjs/axios';

@Injectable()
export class KakaoProviderService implements SocialLoginProvider {
  private readonly tokenEndpoint = 'https://kauth.kakao.com/oauth/token';
  private readonly userInfoEndpoint = 'https://kapi.kakao.com/v2/user/me';

  constructor(private readonly httpService: HttpService) {}

  public async getAccessToken(authCode: string): Promise<string> {
    const clientId = process.env.KAKAO_CLIENT_ID || 'KAKAO_CLIENT_ID';
    const redirectUri = process.env.KAKAO_REDIRECT_URI || 'KAKAO_REDIRECT_URI';

    const params = new URLSearchParams({
      grant_type: 'authorization_code',
      code: authCode,
      client_id: clientId,
      redirect_uri: redirectUri,
    });

    const response: AxiosResponse<any> = await this.httpService.axiosRef.post(
      this.tokenEndpoint,
      params.toString(),
      {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      },
    );

    const { access_token } = response.data;
    return access_token;
  }

  public async getSocialId(accessToken: string): Promise<string> {
    const response: AxiosResponse<any> = await this.httpService.axiosRef.get(
      this.userInfoEndpoint,
      {
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      },
    );

    const { id } = response.data;
    return String(id);
  }
}
