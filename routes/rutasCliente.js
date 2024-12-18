const express = require('express');
const { getAllClients } = require('../controllers/controladorCliente');
const router = express.Router();

router.get('/', getAllClients);

module.exports = router;