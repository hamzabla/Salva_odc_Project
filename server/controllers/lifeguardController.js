const {db} = require("../helpers/firestoreHandler");
const asyncHandler = require("express-async-handler");

const addLifeguard = asyncHandler(async(req,res,next)=>{
    try{
      let {workZone,startTime,EndTime} = req.body;
      console.log(req.body);
      if (
        !workZone ||
        !startTime ||
        !EndTime 
    ) {
        res.status(404).send("missing required values");
        return;
    }
    
    const conn= db.collection('lifeguard').doc();
   
    //add lifeguard to firestore
     const lifeguard= await conn.set({
        workZone,
        startTime,
        EndTime
    });
    
    if (lifeguard) {
        res.status(201).json({
            success: true,
            operation: "add new lifeguard",
            data: {
                workZone,
                startTime,
                EndTime
            }
        });
    } else {
        res.status(404).send('invalid lifeguard data');
        return;
    
    }}catch (err) {
            res.status(404).send(err +'invalid lifeguard data');
            return;
    }});


    const updateLifeguard = asyncHandler(async (req, res, next) => {
        const { id } = req.params;
        const {
            workZone,
            startTime,
            EndTime    
        } = req.body;
    
        if (
            !workZone ||
            !startTime ||
            !EndTime
        ) {
            res.status(400).send('missing required values for life guards update');
            return;
        }
        
        const conn=  db.collection('lifeguard');
     
       const lifeguard =await conn.doc(id);
       await lifeguard.update({
        workZone,
        startTime,
        EndTime 
    });

    const querySnapshot = await db.collection('lifeguard').get();
    querySnapshot.forEach((doc) => {
    if(doc.id ===  id) {
        res.status(200).json(
            {
                success: true,
                operation: "updating lifeguard",
                data: doc.data()
    
            });
    }
    });

});


    module.exports = {
        addLifeguard,
        updateLifeguard
    }