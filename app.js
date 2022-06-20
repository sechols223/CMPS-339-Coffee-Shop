const express = require('express')
const port = 3000
const path = require('path')
const bodyParser = require('body-parser')
const cors = require('cors')


const app = express()
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());


app.use(express.static(path.join(__dirname, 'client/build')));
app.get('/', (req, res) => { 
  res.sendFile(path.join(__dirname + '/client/build/index.html'))
  res.json({satus: true}) 
});

module.exports = app;