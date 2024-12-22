const express = require('express');
const { getAllOrder, createOrder, updateOrder } = require('../controllers/controladorOrden');
const router = express.Router();
const { checkToken } = require('../middleware/checkToken');

// Acceso de administrador y cliente
router.get('/', checkToken, getAllOrder);
router.post('/', checkToken, createOrder);
router.put('/', checkToken, updateOrder);

module.exports = router;