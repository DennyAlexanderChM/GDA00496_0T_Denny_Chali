// routes/userRoutes.js
const express = require('express');
const { getAllUsers, createUser, updateUser } = require('../controllers/controladorUsuario');
const router = express.Router();
const { checkToken } = require('../middleware/checkToken');
const { checkRole } = require('../middleware/checkRole');

// Acceso unicamente para el administrador
router.get('/', checkToken, checkRole( rol = "Operador" ), getAllUsers);
router.post('/', checkToken, checkRole( rol = "Operador" ), createUser);
router.put('/', checkToken, checkRole( rol = "Operador" ), updateUser);

module.exports = router;