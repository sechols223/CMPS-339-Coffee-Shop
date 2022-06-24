const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Session = sequelize.define({

        sid: {
            type: DataTypes.INTEGER,
            primaryKey: true
        },
        UserId: {
            type: DataTypes.INTEGER,
            foreignKey: true,
            allowNull: false
        },
        Expires: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        Data: {
            type: DataTypes.STRING
        }

    })
}