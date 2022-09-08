const {db} = require("../helpers/firestoreHandler");

const asyncHandler = require("express-async-handler");

// add section

const addInterest = asyncHandler(async(req,res,next)=>{
try{
  let {id_user,like,save,id_section} = req.body;
  console.log(req.body);
  if (
    ! id_user||
    ! like||
    !save ||
    !id_section 
) {
    
    res.status(404).send("invalid section data");
    return;
}

const conn= db.collection('interests').doc();




 const interest= await conn.set({
    id_user,
    like,
    save,
    id_section
});

if (interest) {
    res.status(201).json({
        success: true,
        operation: "add new interest",
        data: {
            id_user,
           like,
          save,
          id_section
        }
    });
} else {
    res.status(404).send("invalid interest data");
    return;

}


} catch (err) {
    res.status(404).send("invalid interest data "+$err);
        return;
}

});



const updateInterest = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
        id_user,
        like,
       save,
       id_section
    } = req.body;

    if (
        !id_user ||
        !like ||
        !save ||
        !id_section
    ) {
        res.status(400).send('missing required values');
        return;
    }
    
    const conn= db.collection('interests');
 
   const interest = await conn.doc(id);
   await interest.update({
      id_user,
        like,
       save,
       id_section
    
});

const querySnapshot = await conn.get();
querySnapshot.forEach((doc) => {
if(doc.id ===  id) {
    res.status(200).json(
        {
            success: true,
            operation: "updating interest",
            data: doc.data()

        });
}
});
   
});


const getAllInterests = asyncHandler(async (req, res, next) => {
    let interests = [];
    const querySnapshot = await db.collection('interests').get();
    querySnapshot.forEach((doc) => {
        let added= {id:doc.id, ...doc.data()};
        interests.push(added) ;
});

    res.status(200).json(
        {
            success: true,
            operation: "getting all interests ",
            count: interests.length,
            data: interests
        

        }
    );
});

const getAllSavedByUser = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let interests = [];
    let countsaved = 0;
    const querySnapshot = await db.collection('interests').get();
    const connectTosection = await db.collection('sections').get();

    querySnapshot.forEach( (doc) => {
        if(doc.data().id_user == id){
            if(doc.data().save == "1"){
            connectTosection.forEach( (model) => {
                if(model.id == doc.data().id_section){
                    let added= {id:doc.id, ...doc.data(),...model.data()};
                     console.log(added);
                      interests.push(added);
                }
            }); 
        }  
        }
       
});

for(let i=0;i<interests.length;i++){
    if(interests[i]['save']== '1'){
          countsaved++;
    }
}

res.status(200).json(
    {
        success: true,
        operation: "getting all saved section by user ",
        count: interests.length,
        countSaved: countsaved,
        data: interests
    }
);

});


const getAlllikedByUser = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let interests = [];
    let countliked = 0;
    const querySnapshot = await db.collection('interests').get();
    const connectTosection = await db.collection('sections').get();

    querySnapshot.forEach( (doc) => {
        if(doc.data().id_user == id){
            if(doc.data().like == "1"){
            connectTosection.forEach( (model) => {
                if(model.id == doc.data().id_section){
                    let added= {id:doc.id, ...doc.data(),...model.data()};
                     console.log(added);
                      interests.push(added);
                }
            }); 
        }  
        }
       
});

for(let i=0;i<interests.length;i++){
    if(interests[i]['like']== '1'){
        countliked++;
    }
}

res.status(200).json(
    {
        success: true,
        operation: "getting all liked section by user ",
        count: interests.length,
        countLiked: countliked,
        data: interests
    }
);

});





const addUpdateInterest = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let {id_user,like,save,id_section} = req.body;
    if (
        ! id_user||
        ! like||
        !save ||
        !id_section 
    ) {
    
        res.status(404).send("you should enter all interest fields");
        return;
    }
const conn= await db.collection('interests'); 
const id_passed = String(id_user).concat(String(id_section));
console.log(id_passed);


const querySnapshot = await conn.get();
querySnapshot.forEach((doc) => {
if(doc.id ===  id) {
    const interestUpdate = conn.doc(id);
     interestUpdate.update({
       id_user,
         like,
        save,
        id_section
     
 });
 if (interestUpdate) {
 res.status(200).json(
    {
        success: true,
        operation: "updating interest",
        data: { id_user,
            like,
           save,
           id_section}

    });
return;
}
    else{
        res.status(404).send("interest not updated");
        return;
    }

}
});

const interest= await conn.doc(id_passed).set({
    id_user,
    like,
    save,
    id_section
});
if (interest) {
    res.status(201).json({
        success: true,
        operation: "add new interest",
        data: {id_user,like,save,id_section}
    });
} else {
    res.status(404).send("interest  not added data");
    return;
}

});

const getInterestById = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let interest = '';
    const querySnapshot = await db.collection('interests').get();
    querySnapshot.forEach((doc) => {
    if(doc.id ===  id) {
        interest = doc.data();
    }
});
    if (interest) {
        res.status(200).json(
            {
                success: true,
                operation: "getting interest by id",
                data: interest
                

            }
        );
    } else {
        res.status(404).send("interest do not exist");
        return;
    }

});


  

module.exports = {
    addInterest,
    updateInterest,
    getAllInterests,
    addUpdateInterest,
    getInterestById,
    getAllSavedByUser,
    getAlllikedByUser
}