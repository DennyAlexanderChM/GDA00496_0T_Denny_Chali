// IMPORTAMOS LOS MODELOS DEL LAS TABLAS DE NUESTRA BASE DE DATOS
const sequelize = require('../config/db');
const { Categoria } = require('./categoria');
const { Cliente } = require('./cliente');
const { Detalle } = require('./detalle');
const { Estado } = require('./estados');
const { Orden } = require('./orden');
const { Producto } = require('./producto');
const { Rol } = require('./rol');
const { Usuario } = require('./usuario');

// Exportar modelos y sincronizar
const syncModels = async () => {
  await sequelize.sync({ force: false }); // Crea o actualiza tablas
  console.log('Modelos sincronizados con la base de datos.');
};

module.exports = { sequelize, Categoria, Cliente, Detalle, Estado, Orden, Producto, Rol, Usuario, syncModels };
