interface CognitoAuthResult {
  AccessToken: string;
  IdToken: string;
  RefreshToken?: string;
  ExpiresIn: number;
  TokenType: string;
}
