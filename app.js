const express = require('express');
const { syncModels } = require('./models');
const userRoutes = require('./routes/rutasUsuario');
const categoryRoutes = require('./routes/rutasCategoria');
const clientRoutes = require('./routes/rutasCliente');
const detailRoutes = require('./routes/rutasDetalle');
const stateRoutes = require('./routes/rutasEstados');
const orderRoutes = require('./routes/rutasOrden');
const productRoutes = require('./routes/rutasProducto');
const roleRoutes = require('./routes/rutasRol');

// IMPORTATE SINCRONIZAR LOS MODELOS CON LA BASE DE DATOS
syncModels();

const app = express();

app.use(express.json());

// DOMINIO/usuarios/   DEVUELVE TODOS LOS USUARIOS
app.use('/category', categoryRoutes);
app.use('/client', clientRoutes);
app.use('/detail', detailRoutes);
app.use('/state', stateRoutes);
app.use('/order', orderRoutes);
app.use('/product', productRoutes);
app.use('/users', userRoutes);
app.use('/roles', roleRoutes);

module.exports = app;