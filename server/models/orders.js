const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Order = sequelize.define("Order",
        {
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
            },
            CustomerId: {
                type: DataTypes.INTEGER,
                foreignKey: true,
                allowNull: false
            },
            ProductId: {
                type: DataTypes.INTEGER,
                foreignKey: true,
                allowNull: false
            }
        })
        return Order;
}
