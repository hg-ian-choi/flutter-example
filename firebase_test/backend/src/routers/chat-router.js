const chatService = require('../services/chat-service');
const router = require('express').Router();

router.get('/create', async (request_, response_) => {
  // console.log(request_.body);
  const _result = await chatService.createUser();
  response_.send(_result.data);
});

router.get('/', async (request_, response_) => {
  const _result = await chatService.getUsers();
  response_.send(_result);
});

router.get('/:chat_id', (request_, response_) => {});

module.exports = router;
