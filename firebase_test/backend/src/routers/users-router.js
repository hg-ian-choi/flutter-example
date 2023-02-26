const usersService = require('../services/users-service');
const router = require('express').Router();

router.post('/', (request_, response_) => {
  response_.send('Hello, World!');
});

router.get('/', async (request_, response_) => {
  const result = await usersService.getUsers();
  response_.send('Hello, World!');
});

router.get('/:userId', (request_, response_) => {});

module.exports = router;
