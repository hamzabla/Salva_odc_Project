const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
const asyncHandler = require("express-async-handler");
const User = require("../models/userModel");
const {db} = require("../helpers/firestoreHandler");
const config = require('../helpers/config');



const register = asyncHandler(async (req,res,next) =>{

    const {fullName,userName,email,phone,password,role} = req.body;
    const unique = userName;
    if (
        !fullName ||
        !userName ||
        !email || 
        !phone ||
        !password ||
        !role
    ) {
        res.status(404).send("missing required values");
    }

    
const conn= db.collection('users').doc();

// Check if user exists
let exist = false;
const querySnapshot = await db.collection('users').get();
querySnapshot.forEach((doc) => {
    if(doc.data().userName ===  unique) {
        exist =true;
    }
});
if (exist){
    res.status(404).send("Account already exist!"); 
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
        operation: "register",
        data: {
            fullName,
            userName,
            email,
            phone,
            password: hashedPassword,
            role,
            token: generateToken(userName)
        }
    });
} else {
    res.status(404).send('invalid user data');
}
});

//login a user

const login = asyncHandler(async (req, res, next) => {
    const { userName, password } = req.body;
    // Check for user userName
    const conn= db.collection('users');
    let user ='';
    const querySnapshot = await conn.get();
    querySnapshot.forEach((doc) => {
        if(doc.data().userName ===  userName) {
          user = doc.data();
        }
    });
   
    if (user && (await bcrypt.compare(password, user.password))) {
      
        res.json({
          success: true,
          operation: "login",
          data:{
          name: user.name,
          username: user.username,
          email: user.email,
          token: generateToken(user.username),
    }
  });
      
    } else {
    res.status(404).send('invalid user creds');
    }
  });

  const logout = asyncHandler(async (req, res, next) => {
    const { userName } = req.body;
    // Check for user userName
    const conn= db.collection('users');
    let user ='';
    const querySnapshot = await conn.get();
    querySnapshot.forEach((doc) => {
        if(doc.data().userName ===  userName) {
          user = doc.data();
        }
    });
   
    if (user) {
      
        res.json({
          success: true,
          operation: "logout",
          data:{
          token: null,
    }
  });
      
    } else {
    res.status(404).send('user did not logout');
    }
  });

// Generate JWT
const generateToken = (userName) => {
    return jwt.sign({ userName }, config.jwtoken, {
      expiresIn: "30d",
    });
  };



module.exports = {
    register,
    login,
    logout
  };
  