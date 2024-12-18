const Cliente = require('../models/cliente.js');

// BY SEQUELIZE SEARCH
exports.getAllClients = async (req, res, next) => {
  try {
    const client = await Cliente.findAll();
    res.json(client);
  } catch (err) {
    next(err);
  }
};
