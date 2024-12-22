const express = require('express');
const { getAllRoles, createRole, updateRole } = require('../controllers/controladorRol');
const router = express.Router();
const { checkToken } = require('../middleware/checkToken');
const { checkRole } = require('../middleware/checkRole');

// Acceso unicamente para el administrador
router.get('/', checkToken, checkRole( rol = "Operador" ), getAllRoles);
router.post('/', checkToken, checkRole( rol = "Operador" ), createRole);
router.put('/', checkToken, checkRole( rol = "Operador" ), updateRole);

module.exports = router;