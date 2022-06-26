const express = require('express')
const port = 3000
const path = require('path')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const db = require('./db/database')


//Routes
const customers = require('./api/customer')
const orders = require('./api/orders')
const products = require('./api/products')

const register = require('./routes/register')

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

app.use('/api/customers', customers)
app.use('/auth/register', register);



app.use(express.static(path.join(__dirname, 'client/build')));
app.get('/', (req, res) => { 
  res.sendFile(path.join(__dirname + '/client/build/index.html'))
  res.json({satus: true}) 
});



module.exports = app;