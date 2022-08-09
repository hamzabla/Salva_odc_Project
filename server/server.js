const express = require("express");
const colors = require("colors");
const morgan = require("morgan");
const config = require("./helpers/config");
const cors = require("cors");

const reviews = require('./routes/reviewRoute');



const app = express();
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/api/v1/reviews',reviews);


app.listen(config.port, () => console.log(`Server started on port ${config.port}`));