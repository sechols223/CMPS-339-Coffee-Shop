const express = require('express')
const path = require('path')
const app = express()
const cors = require('cors')

app.use(express.static(path.join(__dirname, './build/web')));
app.use(cors())
app.get('/', (req,res) => {
  res.send('./build/web/index.html')
})


module.exports = app;