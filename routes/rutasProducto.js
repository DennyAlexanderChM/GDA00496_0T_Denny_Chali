const express = require('express');
const { getAllProducts, createProduct, updateProduct } = require('../controllers/controladorProductos');
const router = express.Router();
const { checkToken } = require('../middleware/checkToken');
const { checkRole } = require('../middleware/checkRole');

router.get('/', checkToken, getAllProducts);
router.post('/', checkToken, checkRole( rol = "Operador" ), createProduct);
router.put('/', checkToken, checkRole( rol = "Operador" ), updateProduct);

module.exports = router;