const sequelize = require('sequelize')
const {Sequelize, DataTypes} = require("sequelize");

module.exports = (sequelize, Sequelize) => {
    const Session = sequelize.define('Session',
        {

        sid: {
            type: DataTypes.STRING,
            primaryKey: true,
            get() {
                const rawValue = this.getDataValue('sid');
                return rawValue;
              }
        },
        userid: {
            type: DataTypes.INTEGER,
            foreignKey: true,
            allowNull: false,
            get() {
                const rawValue = this.getDataValue('userid');
                return rawValue;
              },
              getterMethods: {
                userid() {
                    return this.userid
                }
              },
              setterMethods: {
                userid(value) {
                    this.setDataValue('userid', value)
                }

              }
        },
        expires: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        data: {
            type: DataTypes.STRING
        }

    })
    return Session;
}