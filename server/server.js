<<<<<<< HEAD
const express = require("express");
const colors = require("colors");
const morgan = require("morgan");
const config = require("./helpers/config");
const cors = require("cors");
const request = require('request');

const reviews = require('./routes/reviewRoute');



const app = express();
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// app.get('/home', function(req, res) {
//     console.log('hey');
//     request('http://127.0.0.1:3000/flask', function (error, response, body) {
//         console.error('error:', error); // Print the error
//         console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
//         console.log('body:', body); // Print the data received
//         res.send(body); //Display the response on the website
//       });      
// });
app.use('/api/v1/reviews',reviews);


app.listen(config.port, () => console.log(`Server started on port ${config.port}`));
