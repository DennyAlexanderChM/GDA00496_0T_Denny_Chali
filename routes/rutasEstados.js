const express = require('express');
const { getAllStates, createState, updateState } = require('../controllers/controladorEstados');
const { checkToken } = require('../middleware/checkToken');
const { checkRole } = require('../middleware/checkRole');
const router = express.Router();

// Acceso unicamente al administrador
router.get('/', checkToken, checkRole( rol = "Operador" ), getAllStates);
router.post('/', checkToken, checkRole( rol = "Operador" ), createState);
router.put('/', checkToken, checkRole( rol = "Operador" ) , updateState);

module.exports = router;