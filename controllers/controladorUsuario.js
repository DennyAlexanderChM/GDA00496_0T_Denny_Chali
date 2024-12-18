const { Usuario, sequelize } = require('../models/usuario.js');

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
    "rol_ID": 2,
    "estado_ID": "1",
    "correo": "pcousans0@netscape.com",
    "nombre": "Pyotr Cousans",
    "razon_social": "Privado",
    "nombre_comercial": "Privado",
    "direccion_entrega": "01259 Barnett Junction",
    "password": "xZ8%sfia)|X",
    "telefono": "690-846-3978",
    "fecha_nacimiento": "2024-01-28"
}
*/

exports.createUser = async (req, res, next) => {
  try {
    const rolID = req.body.rol_ID;
    const estadoID = req.body.estado_ID;
    const correo = req.body.correo;
    const nombre = req.body.nombre;
    const razonSocial = req.body.razon_social;
    const nombreComercial = req.body.nombre_comercial;
    const direccionEntrega = req.body.direccion_entrega;
    const password = req.body.password;
    const telefono = req.body.telefono;
    const fechaNacimiento = req.body.fecha_nacimiento;
    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearNuevoUsuario :RolID, :EstadoID, :Correo, :Nombre, :Razon_Social, :Nombre_Comercial, :Direccion_Entrega, :Password_Usuario, :Telefono, :Fecha_Nacimiento', {
      replacements: { RolID: rolID, EstadoID: estadoID, Correo: correo, Nombre: nombre, Razon_Social: razonSocial, Nombre_Comercial: nombreComercial, Direccion_Entrega: direccionEntrega, Password_Usuario: password, Telefono: telefono, Fecha_Nacimiento: fechaNacimiento }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};
