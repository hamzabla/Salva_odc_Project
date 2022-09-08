const express = require('express');
const router = express.Router();


const { sendNotification,sendNotificationToDevice }= require('../controllers/notificationController');

router.get("/sendNotifications",sendNotification).post("/sendNotificationToDevice",sendNotificationToDevice);


module.exports = router;