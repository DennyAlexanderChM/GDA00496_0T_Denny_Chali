const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Rol = sequelize.define('Rol',
    {
        RolID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        Nombre_Rol: {
            type: DataTypes.STRING,
        },

    }, {
    tableName: 'Rol',
    timestamps: false,
}
);

module.exports = { Rol, sequelize };