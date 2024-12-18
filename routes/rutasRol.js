const express = require('express');
const { getAllRoles, createRole, updateRole } = require('../controllers/controladorRol');
const router = express.Router();

router.get('/', getAllRoles);
router.post('/', createRole);
router.put('/', updateRole);

module.exports = router;