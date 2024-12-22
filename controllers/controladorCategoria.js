const { Categoria, sequelize } = require('../models/categoria.js');

// BY SEQUELIZE SEARCH
exports.getAllCategories = async (req, res, next) => {
  try {
    const categories = await Categoria.findAll();
    res.json(categories);
  } catch (err) {
    next(err);
  }
};
/*
{
  "usuario_ID": 2,
  "estado_ID": 1,
  "nombre_categoria": "Muebles"
}
*/
exports.createCategory = async (req, res, next) => {
  try {
    const usuarioID = req.body.usuario_ID;
    const estadoID = req.body.estado_ID;
    const nombreCategoria = req.body.nombre_categoria;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearCategoriaProducto :UsuarioID, :EstadoID, :Nombre_Categoria', {
      replacements: { UsuarioID: usuarioID, EstadoID: estadoID, Nombre_Categoria: nombreCategoria }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};

/*
{
  "categoria_ID": 2,
  "usuario_ID": 2,
  "estado_ID": 1,
  "nombre_categoria": "Muebles"
}
*/
exports.updateCategory = async (req, res, next) => {
  try {
    const categoriaID = req.body.categoria_ID;
    const usuarioID = req.body.usuario_ID;
    const estadoID = req.body.estado_ID;
    const nombreCategoria = req.body.nombre_categoria;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarCategoriaProducto :CategoriaID, :UsuarioID, :EstadoID, :Nombre_Categoria', {
      replacements: { CategoriaID: categoriaID, UsuarioID: usuarioID, EstadoID: estadoID, Nombre_Categoria: nombreCategoria }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};