const { Usuario, sequelize } = require('../models/usuario.js');
const { encrypt } = require('../functions/bcrypjs.js')

exports.getAllUsers = async (req, res, next) => {
  try {
    const users = await Usuario.findAll();
    res.json(users);
  } catch (err) {
    next(err);
  }
};

/* 
{
    "rol_ID": rol,
    "estado_ID": estado,
    "correo": "pferrettini4@unicef.org",
    "nombre": "Patrizius Ferrettini",
    "razon_social": "Privado",
    "nombre_comercial": "Divavu",
    "direccion_entrega": "94 4th Court",
    "password": "bJ5=1{d",
    "telefono": "325-480-6955",
    "fecha_nacimiento": "1998-05-23"
}
*/

exports.createUser = async (req, res, next) => {
  try {
    // obtenemos las variables del cuerpo del request
    const { rol_ID, estado_ID, correo, nombre, nombre_comercial, razon_social, password, telefono, fecha_nacimiento, direccion_entrega } = req.body
    // encriptamos la contraseña
    const hash_password = await encrypt(password);

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearUsuarios :RolID, :EstadoID, :Correo, :Nombre, :Razon_Social, :Nombre_Comercial, :Password, :Telefono, :Fecha_Nacimiento, :Direccion', {
      replacements: { RolID: rol_ID, EstadoID: estado_ID, Correo: correo, Nombre: nombre, Nombre_Comercial: nombre_comercial, Razon_Social: razon_social, Password: hash_password, Telefono: telefono, Fecha_Nacimiento: fecha_nacimiento, Direccion: direccion_entrega,  }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }

};

/*
{
    "usuario_ID": id,
    "rol_ID": rol,
    "estado_ID": estado,
    "correo": "pferrettini4@unicef.org",
    "nombre": "Patrizius Ferrettini",
    "razon_social": "Privado",
    "nombre_comercial": "Divavu",
    "direccion_entrega": "94 4th Court",
    "password": "bJ5=1{d",
    "telefono": "325-480-6955",
    "fecha_nacimiento": "1998-05-23"
}
*/
exports.updateUser = async (req, res, next) => {
  try {
    // obtenemos las variables del cuerpo del request
    const { usuario_ID, rol_ID, estado_ID, correo, nombre, razon_social, nombre_comercial, direccion_entrega, password, telefono, fecha_nacimiento } = req.body
    // encriptamos la contraseña
    const hash_password = await encrypt(password);

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarUsuarios :UsuarioID, :RolID, :EstadoID, :Correo, :Nombre, :Nombre_Comercial, :Razon_Social,  :Password_Usuario, :Telefono, :Fecha_Nacimiento, :Direccion', {
      replacements: { UsuarioID:usuario_ID, RolID: rol_ID, EstadoID: estado_ID, Correo: correo, Nombre: nombre, Razon_Social: razon_social, Nombre_Comercial: nombre_comercial, Direccion: direccion_entrega, Password_Usuario: hash_password, Telefono: telefono, Fecha_Nacimiento: fecha_nacimiento }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }

};

