import { ApiProperty } from '@nestjs/swagger';

export class KakaoLoginDto {
  @ApiProperty({ description: '카카오 인증 후 받은 Authorization Code' })
  authCode: string;
}

export class AppleLoginDto {
  @ApiProperty({ description: '애플 인증 후 받은 Authorization Code' })
  authCode: string;
}

export class VerifyTokenDto {
  @ApiProperty({ description: '검증할 JWT 토큰 (AccessToken)' })
  token: string;
}

export class CognitoAuthResultDto implements CognitoAuthResult {
  @ApiProperty()
  AccessToken: string;

  @ApiProperty()
  IdToken: string;

  @ApiProperty({ required: false })
  RefreshToken?: string;

  @ApiProperty()
  ExpiresIn: number;

  @ApiProperty()
  TokenType: string;
}

export class DecodedJwtDto implements DecodedJwt {
  @ApiProperty()
  sub: string;

  @ApiProperty()
  iss: string;

  @ApiProperty()
  aud: string;

  @ApiProperty()
  exp: number;

  @ApiProperty()
  iat: number;

  @ApiProperty({ required: false })
  email?: string;
}
