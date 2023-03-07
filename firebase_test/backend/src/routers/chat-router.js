const chatService = require('../services/chat-service');
const router = require('express').Router();

router.get('/create', async (request_, response_) => {
  const _result = await chatService.createChat();
  response_.send(_result.data);
});

router.get('/', async (request_, response_) => {
  const _result = await chatService.getChatList();
  response_.send(_result);
});

router.get('/:chat_id', (request_, response_) => {});

module.exports = router;
