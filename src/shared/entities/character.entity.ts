import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { User } from './user.entity';
import { CharacterType } from './enums/character.enum';

@Entity('characters')
export class Character {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ type: 'enum', enum: CharacterType, unique: true })
  name: CharacterType;

  @OneToMany(() => User, (user) => user.character)
  users: User[];
}
