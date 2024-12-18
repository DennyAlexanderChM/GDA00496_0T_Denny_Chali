const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Cliente = sequelize.define('Clientes',
    {
        ClienteID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        Razon_Social: {
            type: DataTypes.STRING,
        },
        Nombre_Comercial: {
            type: DataTypes.STRING,
        },
        Direccion_Entrega: {
            type: DataTypes.STRING,
        },
        Telefono: {
            type: DataTypes.STRING,
        },
        Correo: {
            type: DataTypes.STRING,
        },

    }, {
    tableName: 'Clientes',
    timestamps: false,
}
);

module.exports = { Cliente, sequelize };