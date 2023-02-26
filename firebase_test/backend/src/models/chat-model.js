const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const chatSchema = new Schema({
  content: {
    type: String,
    required: true,
  },
  sequence: {
    type: Number,
    required: true,
  },
  users: [
    {
      type: Schema.Types.ObjectId,
      ref: 'User',
      required: true,
    },
  ],
});

const Chat = mongoose.model('Chat', chatSchema);

module.exports = Chat;
