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
    })

const db = {}

db.Sequelize = Sequelize
db.sequelize = sequelize;
db.Product = require('../models/products')
db.Customer = require('../models/customers')
db.Order = require('../models/orders')
db.Session = require('../models/session')
db.User = require('../models/user')

module.exports = db;

