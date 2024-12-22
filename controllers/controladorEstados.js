const { Estado, sequelize } = require('../models/estados.js');

// BY SEQUELIZE SEARCH
exports.getAllStates = async (req, res, next) => {
  try {
    const states = await Estado.findAll();
    res.json(states);
  } catch (err) {
    next(err);
  }
};

/* JSON FORMATO --> METODO POST // CREAR NUEVO ESTADO
{
    "nombre_estado": "Add your name in the body"
}
*/
exports.createState = async (req, res, next) => {
  try {
    // OBTENER NOMBRE
    const nombre = req.body.nombre_estado;
    // ESPERAMOS LA PROMESA DE LA EJECUCIÓN
    await sequelize.query('EXEC P_CrearEstados :nombre_estado', {
      replacements: { nombre_estado: nombre }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};

/* JSON FORMATO --> METODO POST // CREAR NUEVO ESTADO
{   
    "estado_ID": 1,
    "nombre_estado": "Add your name in the body"
}
*/
exports.updateState = async (req, res, next) => {
  try {
    // OBTENER NOMBRE
    const id = req.body.estado_ID;
    const nombre = req.body.nombre_estado;
    // ESPERAMOS LA PROMESA DE LA EJECUCIÓN
    await sequelize.query('EXEC P_ModificarEstado :id_estado, :nombre_estado', {
      replacements: { id_estado: id, nombre_estado: nombre }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};


