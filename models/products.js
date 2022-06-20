const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {

    const Product = sequelize.define("Product",
        {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true
            },
            Name: {
                type: DataTypes.STRING,
                allowNull: false
            },
            Size: {
                type:DataTypes.STRING,
                allwoNull: false
            }
        })
    return Product;
}

