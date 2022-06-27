const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");
const { User } = require('../db/database');

module.exports = (sequelize, Sequelize) => {
    const User = sequelize.define('User', 
    {

        id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            get() {
                const rawValue = this.getDataValue('id');
                return rawValue;
              },
        },
        customerid: {
            type: DataTypes.INTEGER,
            foreignKey: true,
            allowNull: false
        },
        username: {
            type: DataTypes.STRING,
            allowNull: false,
            get() {
                const rawValue = this.getDataValue('password');
                return rawValue ? rawValue.toUpperCase() : null;
              }
        },
        Password: {
            type: DataTypes.STRING,
            allowNull: false,
            get() {
                const rawValue = this.getDataValue('username');
                return rawValue ? rawValue.toUpperCase() : null;
              }
        }
        
        
    })
    return User;
}