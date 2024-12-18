const { Producto, sequelize } = require('../models/producto.js');

// BY SEQUELIZE SEARCH
exports.getAllProducts = async (req, res, next) => {
  try {
    const products = await Producto.findAll();
    res.json(products);
  } catch (err) {
    next(err);
  }
};

// {
//   "CategoriaID": 1,
//   "UsuarioID": 2,
//   "Nombre_Producto": "Jeans Celeste",
//   "Marca": "Levis",
//   "Codigo": "COD0006",
//   "Stock": 10,
//   "EstadoID": 2,
//   "Precio": 249.99,
//   "Foto": "C:\\Fotos\\Jeans.png"
// }
exports.createProduct = async (req, res, next) => {
  try {
    const categoriaID = req.body.categoria_ID;
    const usuarioID = req.body.usuario_ID;
    const nombreProducto = req.body.nombre_producto;
    const marca = req.body.marca;
    const codigo = req.body.codigo;
    const stock = req.body.stock;
    const estadoID = req.body.estado_ID;
    const precio = req.body.precio;
    const foto = req.body.foto;
    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearProducto :CategoriaID, :UsuarioID, :Nombre_Producto, :Marca, :Codigo, :Stock, :EstadoID, :Precio, :Foto', {
      replacements: { CategoriaID: categoriaID, UsuarioID: usuarioID, Nombre_Producto: nombreProducto, Marca: marca, Codigo: codigo, Stock: stock, EstadoID: estadoID, Precio: precio, Foto: foto }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};

// {
//   "ProductoID": 6,
//   "CategoriaID": 1,
//   "UsuarioID": 2,
//   "Nombre_Producto": "Jeans Celeste",
//   "Marca": "Levis",
//   "Codigo": "COD0006",
//   "Stock": 10,
//   "EstadoID": 2,
//   "Precio": 249.99,
//   "Foto": "C:\\Fotos\\Jeans.png"
// }
exports.updateProduct = async (req, res, next) => {
  try {
    const productoID = req.body.producto_ID;
    const categoriaID = req.body.categoria_ID;
    const usuarioID = req.body.usuario_ID;
    const estadoID = req.body.estado_ID;
    const nombreProducto = req.body.nombre_producto;
    const marca = req.body.marca;
    const codigo = req.body.codigo;
    const stock = req.body.stock;
    const precio = req.body.precio;
    const foto = req.body.foto;
    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarProducto :ProductoID, :CategoriaID, :UsuarioID, :EstadoID, :Nombre_Producto, :Marca, :Codigo, :Stock, :Precio, :Foto', {
      replacements: { ProductoID: productoID, CategoriaID: categoriaID, UsuarioID: usuarioID, EstadoID: estadoID, Nombre_Producto: nombreProducto, Marca: marca, Codigo: codigo, Stock: stock, Precio: precio, Foto: foto }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};