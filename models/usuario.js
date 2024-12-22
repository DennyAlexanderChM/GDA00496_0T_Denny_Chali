const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Usuario = sequelize.define('Usuarios',
    {
        UsuarioID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        FK_RolID: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,
            allowNull:false,
        },
        Correo: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Nombre: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Razon_Social: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Nombre_Comercial: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Password: {
            type: DataTypes.STRING,
            allowNull: false,
        },

        Telefono: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        Fecha_Nacimiento: {
            type: DataTypes.DATEONLY,
            allowNull: false,
        },
        Fecha_Creacion: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        Direccion: {
            type: DataTypes.STRING,
            allowNull: false,
        },

    }, {
    tableName: 'Usuarios',
    timestamps: false,
}
);

module.exports = { Usuario, sequelize };