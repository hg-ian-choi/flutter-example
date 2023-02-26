const User = require('../models/user-model');

const createUser = async () => {
  try {
    const _user = new User({
      email: 'ian-choi@gmail.com',
      username: 'ian-choi',
    });
    await _user.save();
    return {
      success: true,
      data: _user,
    };
  } catch (error_) {
    return {
      success: false,
      data: 'Failed to create User',
    };
  }
};

const getUsers = async () => {
  const _users = await User.find();
  return _users;
};

module.exports = { createUser, getUsers };
