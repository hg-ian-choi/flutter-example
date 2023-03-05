// require('dotenv').config();
// const express = require('express');
// const cors = require('cors');
// const WebSocket = require('ws');
// const bodyParser = require('body-parser');
// const mongoose = require('mongoose');
// const userRouter = require('./src/routers/user-router');
// const chatRouter = require('./src/routers/chat-router');
// const http = require('http');
// const socket = require('socket.io');

// const app = express();
// const port = 8080;

// app.use(cors());
// // parse application/x-www-form-urlencoded
// app.use(bodyParser.urlencoded({ extended: false }));
// // parse application/json
// app.use(bodyParser.json());

// main().catch((err) => console.log(err));

// async function main() {
//   mongoose.set('strictQuery', false);
//   mongoose.connect(process.env.MONGODB_URL);
// }

// app.use('/user', userRouter);
// app.use('/chat', chatRouter);

// app.get('/', (req, res) => {
//   res.send('Hello World!');
// });

// // app.listen(port, () => {
// //   console.log(`Example app listening on port ${port}`);
// // });

// // const socket = new WebSocket.Server({
// //   port: 8081,
// // });

// // socket.on('connection', (ws_, req_) => {
// //   ws_.on('message', (msg_) => {
// //     console.log('Message: ' + msg_);
// //     ws_.send('World');
// //   });
// // });

// const server = http.createServer(app);

// const io = socket(server);

// server.listen(8080, function () {
//   console.log(`Socket IO server listening on port: ${port}`);
// });

// io.on('connection', function (socket_) {
//   console.log(socket_.id, 'Socket IO connected');

//   socket_.on('send_message', (data_) => {
//     socket_.broadcast.emit('receive_message', data_);
//   });

//   // broadcasting a entering message to everyone who is in the chatroom
//   io.emit('msg', `${socket.id} has entered the chatroom.`);

//   // message receives
//   socket_.on('msg', function (data) {
//     console.log(socket_.id, ': ', data);
//     // broadcasting a message to everyone except for the sender
//     socket_.broadcast.emit('msg', `${socket_.id}: ${data}`);
//   });

//   // user connection lost
//   socket_.on('disconnect', function (data_) {
//     io.emit('msg', `${socket_.id} has left the chatroom.`);
//   });
// });

// const app = require('express')();
// const http = require('http').createServer(app);

// app.get('/', (req_, res_) => {
//   res_.send('Hello, World!');
// });

// const socketio = require('socket.io')(http);

// socketio.on('connection', (socket_) => {
//   socket_.on('send_message', (data_) => {
//     socket_.broadcast.emit('receive_message', data_);
//   });
// });

// http.listen(8080, () => {
//   console.log(`Socket server listening at port: 8080`);
// });

const WebSocket = require('ws');

const port = 8080;

const wss = new WebSocket.Server({ port: port });
console.log(`[WebSocket] Starting WebSocket server on localhost:${port}`);

wss.on('connection', (ws_, request_) => {
  const clientIp = request_.socket.remoteAddress;
  console.log(`[WebSocket] Client with IP ${clientIp} has connected`);
  ws_.send('Connected to WebSocket server');

  ws_.on('message', (message_) => {
    wss.clients.forEach((client_) => {
      if (client_.readyState === WebSocket.OPEN) {
        client_.send(message_);
      }
    });
    console.log(`[WebSocket] Message ${message_} was received`);
  });
});
