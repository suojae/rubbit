import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToMany,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { Character } from './character.entity';
import { Diary } from './diary.entity';

@Entity('users')
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nickname: string;

  @Column({ nullable: true })
  socialId: string;

  @Column({ default: false })
  agreedToTerms: boolean;

  @ManyToOne(() => Character, (character) => character.users, {
    eager: true,
    nullable: true,
  })
  character: Character | null;

  @OneToMany(() => Diary, (diary) => diary.user)
  diaries: Diary[];

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
