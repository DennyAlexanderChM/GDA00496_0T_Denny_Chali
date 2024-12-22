const { Producto, sequelize } = require('../models/producto.js');

// Traer todos los productos
exports.getAllProducts = async (req, res, next) => {
  try {
    const products = await Producto.findAll();
    res.json(products);
  } catch (err) {
    next(err);
  }
};

/*
http://127.0.0.1:3000/product
metod: POST
{
  categoria_ID: 1,
  usuario_ID: 2,
  nombre_producto: "Jeans Celeste",
  marca: "Levis",
  codigo: "COD0006",
  stock: 10,
  estado_ID: 2,
  precio: 249.99,
  foto: "C:\\Fotos\\Jeans.png"
}
*/
exports.createProduct = async (req, res, next) => {
  try {

    const { categoria_ID, usuario_ID, nombre_producto, marca, codigo, stock, estado_ID, precio, foto } = req.body;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_CrearProducto :categoria_ID, :usuario_ID, :nombre_producto, :marca, :codigo, :stock, :estado_ID, :precio, :foto', {
      replacements: { categoria_ID, usuario_ID, nombre_producto, marca, codigo, stock, estado_ID, precio, foto }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};

/*
http://127.0.0.1:3000/product
metod: PUT
{
  producto_ID: 1,
  categoria_ID: 1,
  usuario_ID: 2,
  nombre_producto: "Jeans Celeste",
  marca: "Levis",
  codigo: "COD0006",
  stock: 10,
  estado_ID: 2,
  precio: 249.99,
  foto: "C:\\Fotos\\Jeans.png"
}
*/
exports.updateProduct = async (req, res, next) => {
  try {
    const { producto_ID, categoria_ID, usuario_ID, nombre_producto, marca, codigo, stock, estado_ID, precio, foto } = req.body;

    // ESPERANDO PROMESA
    await sequelize.query('EXEC P_ModificarProducto :producto_ID, :categoria_ID, :usuario_ID, :nombre_producto, :marca, :codigo, :stock, :estado_ID, :precio, :foto' , {
      replacements: { producto_ID, categoria_ID, usuario_ID, nombre_producto, marca, codigo, stock, estado_ID, precio, foto}
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (err) { // MANEJO DE ERRORES

    next(err);

  }
};