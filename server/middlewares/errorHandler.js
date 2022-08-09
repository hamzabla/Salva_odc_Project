let errorHandler = async (req,res,next)=>{
   
    let {errorCode} = req.salva;
    let errorMsg = "";
    if(errorCode === 'missing required values'){
        errorMsg = "Missing required values!!";
    }
    if(errorCode === 'Account already exist'){
        errorMsg = "Account already exist!!";
    }
    if(errorCode === 'invalid user data'){
        errorMsg = "invalid user data!!";
    }
    res.status(400).json({success:false,error:errorMsg});

}

const endPointNotFound = (req,res,next)=>{
    if(req.salva){
        next();
        return;
    }
    res.status(404).json({success:false,error:"End point not found"});
}

module.exports = {errorHandler,endPointNotFound};