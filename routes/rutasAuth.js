const express = require('express');
const { loginUser } = require('../controllers/controladorAuth');
const router = express.Router();

router.post('/', loginUser);

// router.post('/register', registerCtrl);

module.exports = router;