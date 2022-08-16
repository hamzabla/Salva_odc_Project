const express = require('express');
const router = express.Router();

const { addReview, getReviewById, getAllReviews,updateReview, deleteReview} = require('../controllers/review');

router.get("/:id", getReviewById).get("/",getAllReviews).post("/", addReview).put("/:id",updateReview).delete("/:id",deleteReview);

//router.get("/:id", getUserById).get("/",getAllUsers).post("/",createUser).put("/:id",updateUser).delete("/:id",deleteUser);

module.exports = router;

