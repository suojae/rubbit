import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToOne,
  CreateDateColumn,
  UpdateDateColumn,
  JoinColumn,
} from 'typeorm';
import { Diary } from './diary.entity';

@Entity('diary_advice')
export class DiaryAdvice {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToOne(() => Diary, { onDelete: 'CASCADE' })
  @JoinColumn()
  diary: Diary;

  @Column({ type: 'text', nullable: true })
  encouragement: string;

  @Column({ type: 'text', nullable: true })
  fortune: string;

  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
