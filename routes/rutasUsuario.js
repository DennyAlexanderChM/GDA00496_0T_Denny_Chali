// routes/userRoutes.js
const express = require('express');
const { getAllUsers, createUser, updateUser } = require('../controllers/controladorUsuario');
const router = express.Router();

router.get('/', getAllUsers);

router.post('/', createUser);

router.put('/', updateUser);


module.exports = router;