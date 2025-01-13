import { Injectable } from '@nestjs/common';
import { User } from 'src/shared/entities/user.entity';
import { UserRepository } from '../data/local/repositories/user.repository';
import { CharacterType } from '../../shared/entities/enums/character.enum';

@Injectable()
export class UserService {
  constructor(private readonly userRepository: UserRepository) {}

  async updateUser(
    userUuid: string,
    nickname: string,
    agreedToTerms: boolean,
    characterType: CharacterType | null,
  ): Promise<User> {
    return this.userRepository.updateUserByUuid(
      userUuid,
      nickname,
      agreedToTerms,
      characterType,
    );
  }
}
