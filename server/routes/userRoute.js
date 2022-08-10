const express = require('express');
const router = express.Router();

const { addUser, getUserById, getAllUsers, updateUser, deleteUser  } = require('../controllers/userController');

router.get("/:id", getUserById).get("/",getAllUsers).post("/", addUser).put("/:id",updateUser).delete("/:id",deleteUser);

//router.get("/:id", getUserById).get("/",getAllUsers).post("/",createUser).put("/:id",updateUser).delete("/:id",deleteUser);

module.exports = router;