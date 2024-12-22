const express = require('express');
const { getAllCategories, createCategory, updateCategory } = require('../controllers/controladorCategoria');
const { checkRole } = require('../middleware/checkRole');
const { checkToken } = require('../middleware/checkToken');
const router = express.Router();

// Acceso unicamente al administrador
router.get('/', checkToken, checkRole(rol = "Operador"), getAllCategories);
router.post('/', checkToken, checkRole(rol = "Operador"), createCategory);
router.put('/', checkToken, checkRole(rol = "Operador"), updateCategory,);

module.exports = router;