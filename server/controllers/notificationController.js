const config = require('../helpers/config');
const asyncHandler = require("express-async-handler");
const { json } = require('express');

const pushNotificationService = asyncHandler(async (data, callback) =>{
    var headers = {
      "Content-Type": "application/json; charset =utf-8",
     Authorization : " Basic " +config.onesignalConfig.appKey ,
   };

   var options = {
      host : "onesignal.com",
      port : 443,
      path : "/api/v1/notifications",
      method : "POST",
      headers : headers,
   };

    var http = require ("http") ;
    var req = http.request (options, function ( res ) {
      res.on("data", function (data) {
        console.log (JSON.parse(data)) ;
        return callback(null,JSON.parse(data));
      } ) ;
    }) ;


req.on("error", function (e) {
  return callback ({
      message : e
 });
});

req.write (JSON.stringify(data));
req.end ();
});


const sendNotification = asyncHandler(async (req,res,next) =>{
    var message = {
        app_id: config.onesignalConfig.appId,
        contents: {"en": "Test Push Notification"},
        included_segments : ["All"] ,
        content_available : true ,
        small_icon : "ic_notification_icon",
        data :{ 
            PushTitle : "CUSTOM NOTIFICATION"
        }
    };
    pushNotificationService(message, (error,results)=>{
        if (error){
            return next (error);
          }
          return res.status(200).send({
            message : "Success",
            data : results,
          });
    });

});

const sendNotificationToDevice = (req,res,next) =>{
    var message = {
        app_id: config.onesignalConfig.appId,
        contents: {"en": "Test Push Notification"},
        included_segments : ["included_role_ids"],
        included_role_ids: req.body.devices,
        content_available : true ,
        small_icon : "ic_notification_icon",
        data :{ 
            PushTitle : "CUSTOM NOTIFICATION"
        }
    };

    pushNotificationService(message, (error,results)=>{
        if (error){
            return next (error);
          }
          return res.status(200).send({
            message : "Success",
            data : results,
          });
    });

};


module.exports ={
 sendNotification,
 sendNotificationToDevice

}