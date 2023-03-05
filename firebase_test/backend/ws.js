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
