const usersService = require('../services/users-service');
const router = require('express').Router();

router.get('/create', async (request_, response_) => {
  // console.log(request_.body);
  const _result = await usersService.createUser();
  response_.send(_result.data);
});

router.get('/', async (request_, response_) => {
  const _result = await usersService.getUsers();
  response_.send(_result);
});

router.get('/:userId', (request_, response_) => {});

module.exports = router;
