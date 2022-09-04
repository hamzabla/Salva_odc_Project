const express = require('express');
const router = express.Router();

const { addInterest,updateInterest, getAllInterests, addUpdateInterest, getInterestById, getAllInterestsByUser} = require('../controllers/InterestsController');

router.post("/", addInterest).put("/:id", updateInterest).get("/", getAllInterests).post("/check/:id",addUpdateInterest).get("/:id",getInterestById).get("/user/:id",getAllInterestsByUser);


module.exports = router;