require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const userRouter = require('./src/routers/users-router');

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

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
