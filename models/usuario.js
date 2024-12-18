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
        },
        FK_EstadoID: {
            type: DataTypes.INTEGER,
        },
        Correo: {
            type: DataTypes.STRING,
        },
        Nombre: {
            type: DataTypes.STRING,
        },
        Password_Usuario: {
            type: DataTypes.STRING,
        },

        Telefono: {
            type: DataTypes.STRING,
        },
        Fecha_Nacimiento: {
            type: DataTypes.DATEONLY,
        }, FK_ClienteID: {
            type: DataTypes.INTEGER,
        },
        Fecha_Creacion: {
            type: DataTypes.DATE,
        },

    }, {
    tableName: 'Usuarios',
    timestamps: false,
}
);

module.exports = { Usuario, sequelize };