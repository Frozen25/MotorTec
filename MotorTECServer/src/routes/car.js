const express = require('express');
const customerController = require('../controllers/carController');

const router = express.Router();

router.get('/coche/new/:id', customerController.getNew);
router.get('/coche/used/:id', customerController.getUsed);
router.get('/coche/cs', customerController.getCs);
router.get('/coche/usuario/:id/:cs', customerController.getCarByUser);
router.get('/coche/:id', customerController.getOne);

///
router.post('/add', customerController.save); //
router.get('/delete/:id', customerController.delete);
router.post('/update/:id', customerController.update); //e

module.exports = router;