const express = require("express");
const colors = require("colors");
const morgan = require("morgan");
const config = require("./helpers/config");
const cors = require("cors");

const auth = require('./routes/auth');
const users = require('./routes/userRoute');
const sections = require('./routes/sectionRoute');
const reviews = require('./routes/reviewRoute');
const interest = require('./routes/interestsRoutes');

const app = express();
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use('/api/v1/auth',auth);
app.use('/api/v1/users',users);
app.use('/api/v1/sections',sections);
app.use('/api/v1/reviews',reviews);
app.use('/api/v1/interests',interest);

app.listen(config.port, () => console.log(`Server started on port ${config.port}`));
