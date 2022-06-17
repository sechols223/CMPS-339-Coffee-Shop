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
            }
        })
    return Product;
}

