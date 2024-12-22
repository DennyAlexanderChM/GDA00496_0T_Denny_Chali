const express = require('express');
const { getAllOrder, createOrder, updateOrder } = require('../controllers/controladorOrden');
const router = express.Router();

router.get('/', getAllOrder);

router.post('/', createOrder);

router.put('/', updateOrder);

module.exports = router;