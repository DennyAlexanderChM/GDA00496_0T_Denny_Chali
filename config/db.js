// IMPORTAMOS LAS BLIBLIOTECAS NECESARIAS PARA LA CONEXION A LA BASE DE DATOS
const { Sequelize } = require('sequelize');

const sequelize = new Sequelize(
    // NOMBRE DE TABLA
    'GDA00496_0T_Denny_Chali',
    // USUARIO
    'ADMINDB',
    // CONTRASEÑA
    'j9+jR@Ca^+K5S11#',
    {   
        //NOMBRE DEL PC
        host: 'AlexanderChM',
        // DIALECTO DE SQL SERVER
        dialect: 'mssql',
        // OPCIONES DEL DIALECTO
        dialectOptions:{
            options:{
                encrypt:true,
                trusServerCertificate: true, //❌ SOLO PARA DESARROLLO
            }
        }
    }
);


// TEST DE CONEXIÓN BRINDADA POR SEQUELIZE 
(async () => {
    
    try {
        
        await sequelize.authenticate();
        console.log('Connection has been established successfully.');

    } catch (error) {
        console.error('Unable to connect to the database:', error);
    }
})();

module.exports = sequelize;