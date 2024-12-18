const express = require('express');
const { getAllOrder } = require('../controllers/controladorOrden');
const router = express.Router();

router.get('/', getAllOrder);

module.exports = router;