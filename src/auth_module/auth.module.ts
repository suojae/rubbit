import { Module } from '@nestjs/common';
import { AppleProviderService } from './data/remote/apple-provider.service';
import { AuthController } from './presentation/auth.controller';
import { KakaoProviderService } from './data/remote/kakao-provider.service';
import { CognitoProvider } from './data/remote/cognito.provider';
import { UserRepository } from './data/local/repositories/user.repository';
import { AuthService } from './domain_layer/auth-service';
import { UserService } from './domain_layer/user-service';
import { HttpModule } from '@nestjs/axios';

@Module({
  imports: [HttpModule],
  controllers: [AuthController],
  providers: [
    AppleProviderService,
    KakaoProviderService,
    CognitoProvider,
    UserRepository,
    AuthService,
    UserService,
  ],
  exports: [AuthService],
})
export class AuthModule {}
