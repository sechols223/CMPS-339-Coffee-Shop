const express = require('express')
const path = require('path')
const app = express()

app.use(express.static(path.join(__dirname, './build/web')));

app.get('/', (req,res) => {
  res.send('./build/web/index.html')
})


module.exports = app;