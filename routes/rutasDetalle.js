const express = require('express');
const { getAllDetails } = require('../controllers/controladorDetalle');
const { checkToken } = require('../middleware/checkToken');
const router = express.Router();

router.get('/', checkToken, getAllDetails);

module.exports = router;