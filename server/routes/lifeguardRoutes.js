const express = require('express');
const router = express.Router();

const { addLifeguard, updateLifeguard } = require('../controllers/lifeguardController');

router.post("/", addLifeguard).put("/:id", updateLifeguard);


module.exports = router;