const express = require('express');
const { getAllProducts, createProduct, updateProduct } = require('../controllers/controladorProductos');
const router = express.Router();

router.get('/', getAllProducts);
router.post('/', createProduct);
router.put('/', updateProduct);

module.exports = router;