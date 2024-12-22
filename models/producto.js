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
            allowNull:false,
        },
        FK_UsuarioID: {
            type: DataTypes.INTEGER,
            allowNull:false,
        },
        Nombre_Producto: {
            type: DataTypes.STRING,
            allowNull:false,
        },
        Marca: {
            type: DataTypes.STRING,
            allowNull:false,
        },
        Codigo: {
            type: DataTypes.STRING,
            allowNull:false
        },

        Stock: {
            type: DataTypes.INTEGER,
            allowNull:false,
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,
            allowNull:false,

        },
        Precio: {
            type: DataTypes.FLOAT,
            allowNull:false,
        },
        Foto: {
            type: DataTypes.STRING,
            allowNull:false,
        },
        Fecha_Creacion: {
            type: 'DATETIME',
            allowNull: false,
        },

    }, {
    tableName: 'Productos',
    timestamps: false,
}
);

module.exports = { Producto, sequelize };