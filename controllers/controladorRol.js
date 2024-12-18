const { Rol, sequelize } = require('../models/rol.js');

// BY SEQUELIZE SEARCH
exports.getAllRoles = async (req, res, next) => {
  try {
    const roles = await Rol.findAll();
    res.json(roles);
  } catch (err) {
    next(err);
  }
};

// {
//   "nombre_rol": "Administrador"
// }
exports.createRole = async (req, res, next) => {
  try {

    const nombreRol = req.body.nombre_rol;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearRol :Nombre_Rol', {
      replacements: { Nombre_Rol: nombreRol}
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};
// {
//   "id_rol": 1,
//   "nombre_rol": "Administrador"
// }
exports.updateRole = async (req, res, next) => {
  try {

    const rolID = req.body.rol_id;
    const nombreRol = req.body.nombre_rol;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarRol :RolID, :Nombre_Rol', {
      replacements: { RolID:rolID, Nombre_Rol: nombreRol}
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};