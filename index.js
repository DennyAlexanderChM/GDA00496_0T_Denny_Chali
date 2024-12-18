// IMPORTAMOS LAS BIBLIOTECA Y MODULOS ✌️
const app = require('./app');
// ESCUCHAMOS EN EL PUERTO 3000
const port = 3000;

// Start the server
app.listen(3000, () => {
    console.log('Server is running on http://localhost:3000');
});
