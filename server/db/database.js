const {Sequelize} = require('sequelize');
const dotenv = require('dotenv').config({path: '/server/.env'})
const env = require('/server/.env')

const username = process.env.DB_USERNAME
const password = process.env.DB_PASSWORD
const database = process.env.DB_DATABASE

module.exports = async function connectDb() {
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
    try {
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');
    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }

}

