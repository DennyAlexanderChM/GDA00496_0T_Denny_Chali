const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Categoria = sequelize.define('Categorias',
    {
        CategoriaID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        FK_UsuariosID: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        Nombre_Categoria: {
            type: DataTypes.STRING,
            allowNull: true,
        },
        FK_EstadosID: {
            type: DataTypes.INTEGER,
            allowNull: true,
        },
        Fecha_Creacion: {
            type: 'DATETIME',
            allowNull: false,
        },

    }, {

    tableName: 'CategoriasProductos',
    timestamps:false,
}
);

module.exports = { Categoria, sequelize };