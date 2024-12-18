const Orden = require('../models/orden.js');

// BY SEQUELIZE SEARCH
exports.getAllOrder = async (req, res, next) => {
  try {
    const order = await Orden.findAll();
    res.json(order);
  } catch (err) {
    next(err);
  }
};
