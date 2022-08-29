const express = require('express');
const router = express.Router();

const { register,login, logout } = require('../controllers/auth');

router.post("/register", register).post("/login",login).post("/logout", logout);

module.exports = router;