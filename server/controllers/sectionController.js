const {db} = require("../helpers/firestoreHandler");
const Section = require('../models/sectionModel');
const asyncHandler = require("express-async-handler");

// add section

const addSection = asyncHandler(async(req,res,next)=>{
try{
  let {Title,Picture,Description,Adress,Tags} = req.body;
  console.log(req.body);
  if (
    ! Title||
    ! Picture||
    !Description ||
    !Adress ||
    !Tags 
) {
    
req.salva = { errorCode: "missing required values" }
    next();
    return;
}

const conn= db.collection('sections').doc();




 const section= await conn.set({
    Title,
    Picture,
    Description,
    Adress,
    Tags
});

if (section) {
    res.status(201).json({
        success: true,
        operation: "add new section",
        data: {
            Title,
            Picture,
            Description,
            Adress,
            Tags
        }
    });
} else {
    res.status(404).send("invalid section data");
    /*req.salva = { errorCode: "invalid section data" }
    next();
    return;*/

}


} catch (err) {
    req.salva = { errorCode: "invalid section data" }
        next();
        return;
}

});
const getSectionById = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    let section = '';
    const querySnapshot = await db.collection('sections').get();
    querySnapshot.forEach((doc) => {
    if(doc.id ===  id) {
        section = doc.data();
    }
});
    if (section) {
        res.status(200).json(
            {
                success: true,
                operation: "getting section by id",
                data: section
                

            }
        );
    } else {
        res.status(404).send("section do not exist");
        /*req.salva = { errorCode: "section not exist" }
        next();
        return;*/
    }

});
const getAllSections = asyncHandler(async (req, res, next) => {
    let sections = [];
    const querySnapshot = await db.collection('sections').get();
    querySnapshot.forEach((doc) => {
        let added= {id:doc.id, ...doc.data()};
        sections.push(added) ;
});

    res.status(200).json(
        {
            success: true,
            operation: "getting all sections ",
            count: sections.length,
            data: { 
                sections
            }

        }
    );
});
const updateSection = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    const {
        Title,
        Picture,
        Description,
        Adress,
        Tags,
        
    } = req.body;

    if (
        !Title ||
        !Picture ||
        !Description ||
        !Adress ||
        !Tags 
    ) {
        res.status(400).send('missing required values');
        /*req.salva = { errorCode: "missing required values" }
        next();
        return;*/
    }
    
    const conn= db.collection('sections');
 
   const section = await conn.doc(id);
   await section.update({
    Title,
    Picture,
    Description,
    Adress,
    Tags,
    
});


const querySnapshot = await db.collection('sections').get();
querySnapshot.forEach((doc) => {
if(doc.id ===  id) {
    res.status(200).json(
        {
            success: true,
            operation: "updating section",
            data: doc.data()

        });
}
});
   
});


const deleteSection = asyncHandler(async (req, res, next) => {
    const { id } = req.params;
    const conn= db.collection('sections');
    let sectionDeleted='';
    const querySnapshot = await db.collection('sections').get();
    querySnapshot.forEach((doc) => {
     if(doc.id ===  id) {
    sectionDeleted=doc.data();
}
});
    await conn.doc(id).delete();
    res.status(200).json(
        {
            success: true,
            operation: "delete section ",
            data: {
                sectionDeleted
            }

        }
    );
});







  

module.exports = {
    addSection,
    getSectionById,
    getAllSections,
    updateSection,
    deleteSection
}