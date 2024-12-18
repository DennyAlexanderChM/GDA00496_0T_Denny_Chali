const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Orden = sequelize.define('Orden',
    {
        OrdenID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        FK_UsuarioID: {
            type: DataTypes.INTEGER,
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,
        },
        Nombre: {
            type: DataTypes.STRING,
        },
        Direccion_Envio: {
            type: DataTypes.STRING,
        },
        COrreo: {
            type: DataTypes.STRING,
        },
        Total_Orden: {
            type: DataTypes.FLOAT,
        },
        Fecha_Creacion: {
            type: DataTypes.DATE,
        },
        Fecha_Entrega: {
            type: DataTypes.DATEONLY,
        },
        Telefono: {
            type: DataTypes.STRING,
        },
    }, {
    tableName: 'Orden',
    timestamps: false,
}
);

module.exports = { Orden, sequelize };