require('dotenv').config();
const express = require('express');
const cors = require('cors');
const WebSocket = require('ws');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const userRouter = require('./src/routers/user-router');
const chatRouter = require('./src/routers/chat-router');

const app = express();
const port = 8080;

app.use(cors());
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }));
// parse application/json
app.use(bodyParser.json());

main().catch((err) => console.log(err));

async function main() {
  mongoose.set('strictQuery', false);
  mongoose.connect(process.env.MONGODB_URL);
}

app.use('/user', userRouter);
app.use('/chat', chatRouter);

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});

const socket = new WebSocket.Server({
  port: 8081,
});

socket.on('connection', (ws_, req_) => {
  ws_.on('message', (msg_) => {
    console.log('Message: ' + msg_);
    ws_.send('World');
  });
});