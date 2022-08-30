class Review {
    constructor(ReviewOwner, Body, rating,id_section) {
            this.ReviewOwner = ReviewOwner;
            this.Body = Body;
            this.rating = rating;
            this.id_section= id_section;

    }
}

module.exports = Review;