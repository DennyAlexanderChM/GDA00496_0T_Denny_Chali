const express = require('express');
const { getAllDetails } = require('../controllers/controladorDetalle');
const router = express.Router();

router.get('/', getAllDetails);

module.exports = router;