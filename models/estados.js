const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Estado = sequelize.define('Estados',
    {
        EstadoID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        Nombre_Estado: {
            type: DataTypes.STRING,
        },
    }, {
    tableName: 'Estados',
    timestamps: false,
}
);

module.exports = { Estado, sequelize };