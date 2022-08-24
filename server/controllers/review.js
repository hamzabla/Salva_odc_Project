const {db} = require("../helpers/firestoreHandler");
const Review = require('../models/reviewModel');
const asyncHandler = require("express-async-handler");
// const bcrypt = require("bcryptjs");

const addReview = asyncHandler(async(req,res,next)=>{
try{
  let {ReviewOwner,Body,rating} = req.body;
  console.log(req.body);
  if (
    !ReviewOwner ||
    !Body ||
    !rating
) {
    req.salva = { errorCode: "missing required values" }
    next();
    return;
}

const conn= db.collection('reviews').doc();



 

 const review= await conn.set({
    ReviewOwner,
    Body,
    rating
});

if (review) {
    res.status(201).json({
        success: true,
        operation: "add new review",
        data: {
            ReviewOwner,
            Body,
            rating
        }
    });
} else {
    req.salva = { errorCode: "invalid review data" }
    next();
    return;

}


} catch (err) {
    req.salva = { errorCode: "invalid review data" }
        next();
        return;
}

});



//get review by id
const getReviewById = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let review = '';
    const querySnapshot = await db.collection('reviews').get();
    querySnapshot.forEach((doc) => {
    if(doc.id ===  id) {
        review = doc.data();
    }
});
    if (review) {
        res.status(200).json(
            {
                success: true,
                operation: "getting review by id",
                data: review
                

            }
        );
    } else {
        res.status(404).send('review do not exist');
        /*req.salva = { errorCode: "user not exist" }
        next();
        return;*/
    }
});

const getAllReviews = asyncHandler(async (req, res, next) => {
    let reviews = [];
    const querySnapshot = await db.collection('reviews').get();
    querySnapshot.forEach((doc) => {
        let added= doc.data();
        reviews.push(added) ;
});

    res.status(200).json(
        {
            success: true,
            operation: "getting all reviews ",
            count: reviews.length,
            data: {
                reviews
            }

        }
    );
});


//update review
const updateReview = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
        ReviewOwner,
        Body,
        rating
    } = req.body;
    console.log(req.body);
    if (
        !ReviewOwner ||
        !Body ||
        !rating
    ) {
        res.status(400).send('missing required values');
        /*req.salva = { errorCode: "missing required values" }
        next();
        return;*/
    }
    
    const conn= db.collection('reviews');
 
   const review = await conn.doc(id);
   await review.update({
    ReviewOwner,
    Body,
    rating
});


const querySnapshot = await db.collection('reviews').get();
querySnapshot.forEach((doc) => {
if(doc.id ===  id) {
    res.status(200).json(
        {
            success: true,
            operation: "updating review",
            data: doc.data()

        });
}
});
   
});

// delete review
const deleteReview = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    const conn= db.collection('reviews');
    let reviewDeleted='';
    const querySnapshot = await db.collection('reviews').get();
    querySnapshot.forEach((doc) => {
     if(doc.id ===  id) {
    reviewDeleted=doc.data();
}
});
    await conn.doc(id).delete();
    res.status(200).json(
        {
            success: true,
            operation: "delete review ",
            data: {
                userDeleted
            }

        }
    );
});



module.exports = {
    addReview,
    getReviewById,
    getAllReviews,
    updateReview,
    deleteReview
}