const { DataTypes } = require('sequelize')
const sequelize = require('../config/db.js');

const Detalle = sequelize.define('OrdenDetalle',
    {
        DetalleID: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true,

        },
        FK_OrdenID: {
            type: DataTypes.INTEGER,
        },
        FK_ProductosID: {
            type: DataTypes.INTEGER,
        },
        Cantidad: {
            type: DataTypes.INTEGER,
        },
        Precio: {
            type: DataTypes.FLOAT,
        },
        Sub_Total: {
            type: DataTypes.FLOAT,
        },

    }, {
    tableName: 'OrdenDetalles',
    timestamps: false,
}
);

module.exports = { Detalle, sequelize };