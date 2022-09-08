const {db} = require("./helpers/firestoreHandler");

const express = require("express");
const colors = require("colors");
const morgan = require("morgan");
const config = require("./helpers/config");
const cors = require("cors");
const request = require('request');
const axios = require('axios').default;
const asyncHandler = require("express-async-handler");

const reviews = require('./routes/reviewRoute');
// const makePostRequest=require('./controllers/review')



const app = express();
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// app.get('/home', function(req, res) {
//     request('http://127.0.0.1:3000/flask', function (error, response, body) {
//         console.error('error:', error); // Print the error
//         console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
//         console.log('body:', body); // Print the data received
//         res.send(body); //Display the response on the website
//       });      
// });

function makePostRequest(path, queryObj) {
    axios.post(path, queryObj).then(
        (response) => {
            var result = response.data;
            console.log(result + "teeeeeeeeeeeeeest");
           return result;
        },
        (error) => {
            console.log(error);
        }
    );
}
 



// const evaluteReviews =  asyncHandler(async (req, res, next) => {
//     let reviewsAnalysis = [];
//     let review = "";
//     const querySnapshot = await db.collection('reviews').get();
//     querySnapshot.forEach((doc) => {
//         review= doc.data().Body;
//         console.log(review);
//         queryObj = { "reviews": review };
//         console.log(queryObj);
//         const y = makePostRequest('http://127.0.0.1:3000/test', queryObj);
//         console.log(y);
//         // for (let step = 0; step < ; step++){
//         //     reviewsAnalysis[step] = y
//         // }
//         // y.forEach(element => reviewsAnalysis.push(element));
//         /*const added =makePostRequest('http://127.0.0.1:3000/test', queryObj);
//         console.log(added + "haaaaa");
//         reviewsAnalysis.push(added) ;*/
//         console.log(reviewsAnalysis);
    
// });

//     res.status(200).json(
//         {
//             success: true,
//             operation: "Analyse all reviews ",
//             count: reviewsAnalysis.length,
//             data: {
//                 reviewsAnalysis
//             }

//         }
//     );

// });


// evaluteReviews();


queryObj = { review: 'the best beach' };
makePostRequest('http://127.0.0.1:3000/test', queryObj);


app.use('/api/v1/reviews',reviews);


app.listen(config.port, () => console.log(`Server started on port ${config.port}`));













// x= []
// y.append()