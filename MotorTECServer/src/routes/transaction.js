const express = require('express');
const transactionController = require('../controllers/transactionController');

const router = express.Router();

router.post('/transaction/sell', transactionController.Sell);
router.post('/transaction/buy', transactionController.Buy);

module.exports = router;