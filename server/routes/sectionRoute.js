const express = require('express');
const router = express.Router();
const section = require("../models/sectionModel");

const { addSection, getSectionById, getAllSections, updateSection, deleteSection }= require('../controllers/sectionController');

router.get("/:id",getSectionById).get("/",getAllSections).post("/",addSection).put("/:id",updateSection).delete("/:id",deleteSection);


module.exports = router;
