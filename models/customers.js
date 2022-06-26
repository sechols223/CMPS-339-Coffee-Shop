const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Customer = sequelize.define("Customer",
        {
        id: {
            type: DataTypes.INTEGER,
            primaryKey: true
        },
        firstname: {
            type: DataTypes.STRING,
            allowNull: false
        },
        lastname: {
            type: DataTypes.STRING,
            allowNull: false
        },
        address: {
            type: DataTypes.STRING,
            allowNull: false
        }

        })
    return Customer;
}
