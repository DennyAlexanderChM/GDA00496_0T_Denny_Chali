const { Detalle, sequelize } = require('../models/detalle.js');

// Traer todos los detalles de las ordenes
exports.getAllDetails = async (req, res, next) => {
  try {
    const details = await Detalle.findAll();
    res.json(details);
  } catch (err) {
    next(err);
  }
};
