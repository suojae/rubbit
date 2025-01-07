import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToOne,
  CreateDateColumn,
  UpdateDateColumn,
  JoinColumn,
} from 'typeorm';
import { User } from './user.entity';
import { Emotion } from './emotion.entity';
import { DiaryAdvice } from './diary-advice.entity';

@Entity('diaries')
export class Diary {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User, (user) => user.diaries, {
    onDelete: 'CASCADE',
  })
  user: User;

  @Column({ type: 'text' })
  content: string;

  @ManyToOne(() => Emotion, (emotion) => emotion.diaries, {
    eager: true,
    nullable: true,
  })
  emotion: Emotion;

  @OneToOne(() => DiaryAdvice, (advice) => advice.diary, { cascade: true })
  @JoinColumn()
  diaryAdvice: DiaryAdvice;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
