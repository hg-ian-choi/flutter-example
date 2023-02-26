const User = require('../models/user-model');

const createUser = () => {
  const user = new User();
  user.save((error_, user_) => {
    console.log('svae');
    if (error_) {
      return {
        success: false,
        data: error_.message,
      };
    } else {
      return {
        success: true,
        data: user_,
      };
    }
  });
};

const getUsers = () => {
  return 'Hello, World!';
};

module.exports = { createUser, getUsers };
