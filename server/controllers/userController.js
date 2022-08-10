const {db} = require("../helpers/firestoreHandler");
const User = require('../models/userModel');
const asyncHandler = require("express-async-handler");
const bcrypt = require("bcryptjs");


const addUser = asyncHandler(async(req,res,next)=>{
try{
  let {fullName,userName,email,phone,password,role} = req.body;
  const unique = userName;
  console.log(req.body);
  if (
    !fullName ||
    !userName ||
    !email || 
    !phone ||
    !password ||
    !role
) {
    req.salva = { errorCode: "missing required values" }
    next();
    return;
}

const conn= db.collection('users').doc();

// Check if user exists
let exist = false;
const querySnapshot = await db.collection('users').get();
querySnapshot.forEach((doc) => {
    //console.log(doc.id, ' => ', doc.data());
    if(doc.data().userName ===  unique) {
        exist =true;
        console.log("ERRRRRRRRRRRRRRRRRRRRROR");
    }
});
if (exist){
    res.status(404).send("Account already exist!");
    /*req.salva = { errorCode: "Account already exist" }
    next();
    return;*/
}

 // Hash password
 const salt = await bcrypt.genSalt(10);
 const hashedPassword = await bcrypt.hash(password, salt);
//add user to firestore
 const user= await conn.set({
    fullName,
    userName,
    email,
    phone,
    password: hashedPassword,
    role
});

if (user) {
    res.status(201).json({
        success: true,
        operation: "add new user",
        data: {
            fullName,
            userName,
            email,
            phone,
            password: hashedPassword,
            role
        }
    });
} else {
    res.status(404).send('invalid user data');
    /*req.salva = { errorCode: "invalid user data" }
    next();
    return;*/

}}catch (err) {
    req.salva = { errorCode: "invalid user data" }
        next();
        return;
}});



const getUserById = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let user = '';
    const querySnapshot = await db.collection('users').get();
    querySnapshot.forEach((doc) => {
    if(doc.id ===  id) {
        user = doc.data();
    }
});
    if (user) {
        res.status(200).json(
            {
                success: true,
                operation: "getting user by id",
                data: user
                

            }
        );
    } else {
        res.status(404).send('user do not exist');
        /*req.smartShelf = { errorCode: "user not exist" }
        next();
        return;*/
    }

});




module.exports = {
    addUser,
    getUserById
}