const Chat = require('../models/chat-model');

const createChat = async () => {
  try {
    const _chat = new Chat({
      content: '',
      sequence: 0,
      users: [],
      notRead: [],
    });
    await _chat.save();
    return {
      success: true,
      data: _chat,
    };
  } catch (error_) {
    return {
      success: false,
      data: 'Failed to create Chat',
    };
  }
};

const getChatList = async () => {
  const _chatList = await Chat.find();
  return _chatList;
};

module.exports = { createChat, getChatList };
