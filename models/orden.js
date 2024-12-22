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
            allowNull: false,
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        Nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Direccion_Envio: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Correo: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Total_Orden: {
            type: DataTypes.FLOAT,
            allowNull: false,
        },
       
        Fecha_Entrega: {
            type: DataTypes.DATEONLY,
            allowNull: false,
        },
        Telefono: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Fecha_Creacion: {
            type: 'DATETIME',
            allowNull: false,
        },
    }, {
    tableName: 'Orden',
    timestamps: false,
}
);

module.exports = { Orden, sequelize };