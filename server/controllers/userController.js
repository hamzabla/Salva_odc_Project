const {db} = require("../helpers/firestoreHandler");
const User = require('../models/userModel');
const asyncHandler = require("express-async-handler");
const bcrypt = require("bcryptjs");

const addUser = asyncHandler(async(req,res,next)=>{
try{
  let {fullName,userName,email,phone,password,role} = req.body;
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

 /*const userExists =
(await User.findOne({ email })) || (await User.findOne({ username }));
if (userExists) {
req.salva = { errorCode: "Account already exist" }
next();
return;
}*/


 // Hash password
 const salt = await bcrypt.genSalt(10);
 const hashedPassword = await bcrypt.hash(password, salt);

 

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
    req.salva = { errorCode: "invalid user data" }
    next();
    return;

}


} catch (err) {
    req.smartShelf = { errorCode: "invalid user data" }
        next();
        return;
}

});



module.exports = {
    addUser
}