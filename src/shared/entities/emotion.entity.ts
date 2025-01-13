import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToMany,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { Diary } from './diary.entity';
import { EmotionType } from './enums/emotion.enum';

@Entity('emotions')
export class Emotion {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'enum', enum: EmotionType, unique: true })
  name: EmotionType;

  @OneToMany(() => Diary, (diary) => diary.emotion)
  diaries: Diary[];

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
