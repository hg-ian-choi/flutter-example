const userService = require('../services/user-service');
const router = require('express').Router();

router.get('/create', async (request_, response_) => {
  // console.log(request_.body);
  const _result = await userService.createUser();
  response_.send(_result.data);
});

router.get('/', async (request_, response_) => {
  const _result = await userService.getUsers();
  response_.send(_result);
});

router.get('/:user_id', (request_, response_) => {});

module.exports = router;
