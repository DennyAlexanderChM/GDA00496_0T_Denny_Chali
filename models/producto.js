const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Producto = sequelize.define('Productos',
    {
        ProductoID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        FK_CategoriaID: {
            type: DataTypes.INTEGER,
        },
        FK_UsuarioID: {
            type: DataTypes.INTEGER,
        },
        Nombre_Producto: {
            type: DataTypes.STRING,
        },
        Marca: {
            type: DataTypes.STRING,
        },
        Codigo: {
            type: DataTypes.STRING,
        },

        Stock: {
            type: DataTypes.FLOAT,
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,

        },
        Precio: {
            type: DataTypes.FLOAT,
        },
        Foto: {
            type: DataTypes.STRING,
        },
        Fecha_Creacion: {
            type: DataTypes.DATE,
        },

    }, {
    tableName: 'Productos',
    timestamps: false,
}
);

module.exports = { Producto, sequelize };