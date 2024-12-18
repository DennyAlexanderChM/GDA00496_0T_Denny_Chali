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
        },
        Nombre_Categoria: {
            type: DataTypes.STRING,
        },
        FK_EstadosID: {
            type: DataTypes.INTEGER,
        },
        Fecha_Creacion: {
            type: DataTypes.DATE,
        },

    }, {
    tableName: 'CategoriasProductos',
    timestamps: false,
}
);

module.exports = { Categoria, sequelize };