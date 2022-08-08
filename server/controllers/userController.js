
const firebase = require('../helpers/firestoreHandler');
const User = require('../models/userModel');
const firestore = firebase.firestore;


const addUser = async (req, res, next) => {
    try {
        const data = req.body;
        await firestore.collection('users').doc().set(data);
        res.send('Record saved successfuly');
    } catch (error) {
        res.status(400).send(error.message);
    }
}


module.exports = {
    addUser
}