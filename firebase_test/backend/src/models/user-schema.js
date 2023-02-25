import mongoose from 'mongoose';
const { Schema } = mongoose;

export const User = new Schema({
  uid: String,
  email: String,
});
