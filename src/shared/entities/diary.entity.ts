import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  CreateDateColumn,
  UpdateDateColumn,
} from 'typeorm';
import { User } from './user.entity';
import { Emotion } from './emotion.entity';

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
    nullable: false,
  })
  @CreateDateColumn()
  createdAt: Date;

  @UpdateDateColumn()
  updatedAt: Date;
}
