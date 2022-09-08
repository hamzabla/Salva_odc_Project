const express = require('express');
const router = express.Router();

const { addInterest,updateInterest, getAllInterests, addUpdateInterest, getInterestById, getAllSavedByUser, getAlllikedByUser} = require('../controllers/InterestsController');

router.post("/", addInterest).put("/:id", updateInterest).get("/", getAllInterests).post("/check/:id",addUpdateInterest).get("/:id",getInterestById).get("/save/:id",getAllSavedByUser).get("/like/:id",getAlllikedByUser);


module.exports = router;