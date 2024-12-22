const { Orden, sequelize } = require('../models/orden.js');

// BY SEQUELIZE SEARCH
exports.getAllOrder = async (req, res, next) => {
  try {
    const order = await Orden.findAll();
    res.json(order);
  } catch (err) {
    next(err);
  }
};

/*
http://127.0.0.1:3000/order
metod: POST
[
    {
        "usuario_ID": 5,
        "fecha_entrega": "2025-10-10",
        "total_orden": 1000,
        "productos": [
            {
                "ProductoID": 1,
                "Cantidad": 1,
                "Precio": 1200.99,
                "SubTotal": 1200.99
            },
            {
                "ProductoID": 2,
                "Cantidad": 1,
                "Precio": 79.99,
                "SubTotal": 79.99 
            },
            {
                "ProductoID": 4,
                "Cantidad": 3,
                "Precio": 99.99,
                "SubTotal": 299.97
            }
        ]
    }
]
*/
exports.createOrder = async (req, res, next) => {
  try {
    const { usuario_ID, fecha_entrega, total_orden, productos } = req.body[0];
    await sequelize.query('EXEC P_CrearOrden :usuario_ID, :fecha_entrega, :total_orden, :productos', {
      replacements: { usuario_ID, fecha_entrega, total_orden, productos: JSON.stringify(productos) }
    });
    // RESPUESTA
    res.json({ "Mensaje": "Correcto" });

  } catch (error) { // MANEJO DE ERRORES
    next(error);
  }
};

/*
http://127.0.0.1:3000/order
metod: PUT
{
  "orden_ID": 2,
  "estado_ID": 3,
  "nombre": "Mufi Mellsop",
  "direccion": "227244 Valley Edge Drive",
  "correo": "mmellsop2@friendfeed.com",
  "total_orden": 12709.82,
  "fecha_entrega": "2025-01-11",
  "telefono": "507-588-1384"
}
*/
exports.updateOrder = async (req, res, next) => {
  try {
    const { orden_ID, estado_ID, nombre, direccion, correo, total_orden, fecha_entrega, telefono } = req.body;
    await sequelize.query('EXEC P_ModificarOrden :orden_ID, :estado_ID, :nombre, :direccion, :correo, :total_orden, :fecha_entrega, :telefono', {
      replacements: { orden_ID, estado_ID, nombre, direccion, correo, total_orden, fecha_entrega, telefono }
    });

    // RESPUESTA
    res.json({ "Mensaje": "Correcto" })

  } catch (error) { // MANEJO DE ERRORES
    next(error);
  }
}

