const express = require('express');
const router = express.Router();
const { syncModels } = require('./models');
const userRoutes = require('./routes/rutasUsuario');
const categoryRoutes = require('./routes/rutasCategoria');
const detailRoutes = require('./routes/rutasDetalle');
const stateRoutes = require('./routes/rutasEstados');
const orderRoutes = require('./routes/rutasOrden');
const productRoutes = require('./routes/rutasProducto');
const roleRoutes = require('./routes/rutasRol');
const authRoutes = require('./routes/rutasAuth');

// IMPORTATE SINCRONIZAR LOS MODELOS CON LA BASE DE DATOS
syncModels();

const app = express();

app.use(express.json());

// DOMINIO/usuarios/   DEVUELVE TODOS LOS USUARIOS
app.use('/category', categoryRoutes);
app.use('/detail', detailRoutes);
app.use('/state', stateRoutes);
app.use('/order', orderRoutes);
app.use('/product', productRoutes);
app.use('/users', userRoutes);
app.use('/roles', roleRoutes);
app.use('/login', authRoutes);

app.get('*', (req, res) => {
    res.status(404);
    res.send({ error: 'Not found' });
})

module.exports = app;