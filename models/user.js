const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Session = sequelize.define({

        id: {
            type: DataTypes.INTEGER,
            primaryKey: true
        },
        CustomerId: {
            type: DataTypes.INTEGER,
            foreignKey: true,
            allowNull: false
        },
        Username: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Password: {
            type: DataTypes.STRING,
            allowNull: false
        }

    })
}