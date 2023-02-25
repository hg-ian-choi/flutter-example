import mongoose from 'mongoose';
import { User } from './user-schema';
const { Schema } = mongoose;

const Chat = new Schema({
  users: [{ type: User, default: [] }],
  content: String
});
