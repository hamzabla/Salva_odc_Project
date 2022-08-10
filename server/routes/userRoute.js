const express = require('express');
const router = express.Router();

const { addUser, getUserById } = require('../controllers/userController');

router.get("/:id", getUserById).post("/", addUser);

//router.get("/:id", getUserById).get("/",getAllUsers).post("/",createUser).put("/:id",updateUser).delete("/:id",deleteUser);

module.exports = router;