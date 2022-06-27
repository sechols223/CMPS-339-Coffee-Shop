const express = require('express')
const port = 3000
const path = require('path')
const session = require('express-session')
const SequelizeStore = require('connect-session-sequelize')(session.Store)
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()
const db = require('./db/database')


//Routes
const customers = require('./api/customer')
const orders = require('./api/orders')
const products = require('./api/products')
const register = require('./routes/register')

const login = require('./routes/login')
const auth = require('./middlewares/authentication')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

app.use('/api/customers', customers)
app.use('/api/products', products)
app.use('/api/orders', orders)
app.use('/auth/register', register)
app.use('/auth/login', login)

app.use(express.static(path.join(__dirname, './build/web')));

app.get('/', (req,res) => {
  res.send('./build/web/index.html')
})


module.exports = app;