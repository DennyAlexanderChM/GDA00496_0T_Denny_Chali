const express = require('express');
const { loginUser } = require('../controllers/controladorAuth');
const router = express.Router();

// Acceso de administrador y cliente
router.post('/', loginUser);

module.exports = router;