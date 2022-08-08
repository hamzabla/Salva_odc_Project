const firebase = require('firebase');
const config = require('./config');

const connectDB = async () => {
    try {
        const conn = await firebase.initializeApp(config.firebaseConfig);
        console.log(`Firebase Connected: ${conn}`.cyan.underline);
      } catch (error) {
        console.log(error);
        process.exit(1);
      }
    
};


module.exports = connectDB;