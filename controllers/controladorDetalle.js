const Detalle = require('../models/detalle.js');

// BY SEQUELIZE SEARCH
exports.getAllDetails = async (req, res, next) => {
  try {
    const details = await Detalle.findAll();
    res.json(details);
  } catch (err) {
    next(err);
  }
};
