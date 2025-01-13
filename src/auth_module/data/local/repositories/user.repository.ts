import { Injectable, NotFoundException } from '@nestjs/common';
import { DataSource, Repository } from 'typeorm';
import { User } from 'src/shared/entities/user.entity';
import { Character } from 'src/shared/entities/character.entity';
import { CharacterType } from '../../../../shared/entities/enums/character.enum';

@Injectable()
export class UserRepository extends Repository<User> {
  constructor(private dataSource: DataSource) {
    super(User, dataSource.createEntityManager());
  }

  async findBySocialId(socialId: string): Promise<User | null> {
    return this.findOne({ where: { socialId } });
  }

  async createUserWithSocialId(socialId: string): Promise<User> {
    const user = this.create({
      nickname: '',
      socialId,
      agreedToTerms: false,
      character: null,
    });
    return this.save(user);
  }

  async updateUserByUuid(
    userUuid: string,
    nickname: string,
    agreed: boolean,
    characterType: CharacterType | null,
  ): Promise<User> {
    const user = await this.findOne({ where: { id: userUuid } });
    if (!user) {
      throw new NotFoundException('User not found');
    }

    let characterEntity: Character | null = null;
    if (characterType) {
      characterEntity = await this.manager
        .getRepository(Character)
        .findOne({ where: { name: characterType } });

      if (!characterEntity) {
        throw new NotFoundException(`Character ${characterType} not found`);
      }
    }

    user.nickname = nickname;
    user.agreedToTerms = agreed;
    user.character = characterEntity;

    return this.save(user);
  }
}
