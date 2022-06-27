const {Sequelize, DataTypes} = require('sequelize');
const dotenv = require('dotenv').config({path: '.env'})

const username = process.env.DB_USERNAME
const password = process.env.DB_PASSWORD
const database = process.env.DB_DATABASE

const sequelize = new Sequelize(
    database,
    username,
    password,
    {
        
        host: process.env.DB_HOST,
        dialect: 'postgres',
        dialectOptions: {
            ssl: {
                require: true,
                rejectUnauthorized: false
                } 
            },
            define: {
                freezeTableName: true,
                timestamps: false
              }
    })

const db = {}

db.Sequelize = Sequelize
db.sequelize = sequelize;
db.Product = require('../models/products')(sequelize, Sequelize)
db.Customer = require('../models/customers')(sequelize, Sequelize)
db.Order = require('../models/orders')(sequelize, Sequelize)
db.Session = require('../models/session')(sequelize, Sequelize)
db.User = require('../models/user')(sequelize, Sequelize)

module.exports = db;

