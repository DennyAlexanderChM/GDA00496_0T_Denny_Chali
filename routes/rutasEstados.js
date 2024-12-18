const express = require('express');
const { getAllStates, createState, updateState } = require('../controllers/controladorEstados');
const router = express.Router();

// PETICION CON EL METODO GET
router.get('/', getAllStates);
// PETICION CON EL METODO POST
router.post('/', createState);

router.put('/', updateState);

module.exports = router;