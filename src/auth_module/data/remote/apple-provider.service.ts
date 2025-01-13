import { Injectable } from '@nestjs/common';
import { AxiosResponse } from 'axios';
import { HttpService } from '@nestjs/axios';
import * as jwt from 'jsonwebtoken';

@Injectable()
export class AppleProviderService {
  private readonly tokenEndpoint = 'https://appleid.apple.com/auth/token';

  private idToken: string | null = null;

  constructor(private readonly httpService: HttpService) {}

  public async getAccessToken(authCode: string): Promise<string> {
    const clientId = process.env.APPLE_CLIENT_ID || 'DEFAULT_APPLE_CLIENT_ID';
    const clientSecret =
      process.env.APPLE_CLIENT_SECRET || 'DEFAULT_APPLE_CLIENT_SECRET';
    const redirectUri =
      process.env.APPLE_REDIRECT_URI || 'DEFAULT_APPLE_REDIRECT_URI';

    const params = new URLSearchParams({
      grant_type: 'authorization_code',
      code: authCode,
      client_id: clientId,
      client_secret: clientSecret,
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

    const { access_token, id_token } = response.data;
    this.idToken = id_token;
    return access_token;
  }

  public async getSocialId(): Promise<string> {
    if (!this.idToken) {
      throw new Error('No id_token found.');
    }

    const decoded = jwt.decode(this.idToken) as { sub: string } | null;
    if (!decoded?.sub) {
      throw new Error('Invalid id_token: no sub claim found.');
    }

    return decoded.sub;
  }
}
