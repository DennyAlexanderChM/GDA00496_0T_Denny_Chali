const express = require('express');
const { getAllCategories, createCategory, updateCategory } = require('../controllers/controladorCategoria');
const router = express.Router();

router.get('/', getAllCategories);
router.post('/', createCategory);
router.put('/', updateCategory);

module.exports = router;