const express = require('express');
const router = express.Router();

const { addReview, getReviewById, getAllReviews,updateReview, deleteReview, getAllReviewsBySectionId} = require('../controllers/reviewController');

router.get("/:id", getReviewById).get("/",getAllReviews).post("/", addReview).put("/:id",updateReview).delete("/:id",deleteReview).get("/section/:id",getAllReviewsBySectionId);


module.exports = router;