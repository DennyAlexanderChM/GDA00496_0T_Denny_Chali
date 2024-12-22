const { Categoria, sequelize } = require('../models/categoria.js');

// Traer todas las categorias
exports.getAllCategories = async (req, res, next) => {
  try {
    const categories = await Categoria.findAll();
    res.json(categories);
  } catch (err) {
    next(err);
  }
};
/*
http://127.0.0.1:3000/category
metod: POST
{
  "usuario_ID": 2,
  "estado_ID": 1,
  "nombre_categoria": "Muebles"
}
*/
exports.createCategory = async (req, res, next) => {
  try {

    const { usuario_ID, estado_ID, nombre_categoria } = req.body;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearCategoriaProducto :usuario_ID, :estado_ID, :nombre_categoria', {
      replacements: { usuario_ID, estado_ID, nombre_categoria }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};

/*
http://127.0.0.1:3000/category
metod: PUT
{
  "categoria_ID": 2,
  "usuario_ID": 2,
  "estado_ID": 1,
  "nombre_categoria": "Muebles"
}
*/
exports.updateCategory = async (req, res, next) => {
  try {
    const { categoria_ID, usuario_ID, estado_ID, nombre_categoria } = req.body;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarCategoriaProducto :categoria_ID, :usuario_ID, :estado_ID, :nombre_categoria', {
      replacements: { categoria_ID, usuario_ID, estado_ID, nombre_categoria }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};
