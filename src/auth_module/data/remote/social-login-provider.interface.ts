export interface SocialLoginProvider {
  getAccessToken(authCode: string): Promise<string>;
  getSocialId(accessToken: string): Promise<string>;
}
