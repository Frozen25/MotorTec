const express = require('express');
const locationController = require('../controllers/locationController');

const router = express.Router();

router.get('/location/country/', locationController.getCountry);
router.get('/location/province/:id', locationController.getProvince);
router.get('/location/canton/:id', locationController.getCanton);
router.get('/location/district/:id', locationController.getDistrict);

module.exports = router;