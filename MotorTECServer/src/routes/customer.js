const express = require('express');
const customerController = require('../controllers/customerController');

const router = express.Router();

router.post('/customer/add', customerController.addCustomer);
router.get('/customer/get/:id', customerController.getCustomer);

module.exports = router;