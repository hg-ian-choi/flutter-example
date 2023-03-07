const app = require('express')();
const http = require('http').createServer(app);

app.get('/', (req, res) => {
  res.send('Hello, World!');
});

const socketio = require('socket.io')(http);

socketio.on('connection', (socket_) => {
  socket_.on('send_message', (data) => {
    socket_.broadcast.emit('receive_message', data);
  });
});

http.listen(8080);
