import { Body, Controller, Param, Patch, Post, Res } from '@nestjs/common';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import e, { Response } from 'express';
import { AuthService } from '../domain_layer/auth-service';
import { AppleLoginDto, KakaoLoginDto } from './auth.dto';
import { User } from '../../shared/entities/user.entity';
import { CharacterType } from '../../shared/entities/enums/character.enum';
import { UserService } from '../domain_layer/user-service';

@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  constructor(
    private readonly authService: AuthService,
    private readonly userService: UserService,
  ) {}

  @Post('kakao')
  @ApiOperation({ summary: '카카오 로그인' })
  async loginWithKakao(
    @Body() dto: KakaoLoginDto,
    @Res() res: Response,
  ): Promise<e.Response<any, Record<string, any>>> {
    const { accessToken, expiresIn, userUuid } =
      await this.authService.loginWithKakao(dto.authCode);

    // 헤더에 담기
    res.setHeader('Authorization', `Bearer ${accessToken}`);
    res.setHeader('X-Expires-In', String(expiresIn));
    res.setHeader('X-User-Uuid', userUuid);

    return res.status(200).send();
  }

  @Post('apple')
  @ApiOperation({ summary: '애플 로그인' })
  async loginWithApple(
    @Body() dto: AppleLoginDto,
    @Res() res: Response,
  ): Promise<e.Response<any, Record<string, any>>> {
    const { accessToken, expiresIn, userUuid } =
      await this.authService.loginWithApple(dto.authCode);

    res.setHeader('Authorization', `Bearer ${accessToken}`);
    res.setHeader('X-Expires-In', String(expiresIn));
    res.setHeader('X-User-Uuid', userUuid);

    return res.status(200).send();
  }

  @Post('refresh')
  @ApiOperation({ summary: '토큰 갱신' })
  async refreshToken(
    @Body() body: { refreshToken: string },
    @Res() res: Response,
  ): Promise<Response> {
    const { refreshToken } = body;
    const {
      accessToken,
      expiresIn,
      refreshToken: newRefresh,
    } = await this.authService.refreshCognitoToken(refreshToken);

    // 헤더 or 응답 바디에 담아 리턴
    res.setHeader('Authorization', `Bearer ${accessToken}`);
    res.setHeader('X-Expires-In', String(expiresIn));
    res.setHeader('X-Refresh-Token', newRefresh);

    return res.status(200).send();
  }

  @Patch(':uuid')
  @ApiOperation({ summary: '유저 정보 업데이트' })
  async updateUser(
    @Param('uuid') userUuid: string,
    @Body()
    body: {
      nickname: string;
      agreedToTerms: boolean;
      characterType?: CharacterType;
    },
  ): Promise<User> {
    const { nickname, agreedToTerms, characterType } = body;
    return this.userService.updateUser(
      userUuid,
      nickname,
      agreedToTerms,
      characterType || null,
    );
  }
}
