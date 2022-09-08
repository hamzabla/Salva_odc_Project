'use strict'; //https://www.w3schools.com/js/js_strict.asp#:~:text=The%20%22use%20strict%22%20Directive&text=It%20is%20not%20a%20statement,for%20example%2C%20use%20undeclared%20variables. => why using use strict mode
const dotenv = require('dotenv');
const assert = require('assert');

dotenv.config();

const {
    PORT,
    HOST,
    HOST_URL,
    JWT_SECRET,
    API_KEY,
    AUTH_DOMAIN,
    PROJECT_ID,
    STORAGE_BUCKET,
    MESSAGING_SENDER_ID,
    APP_ID,
    OneSignal_APP_ID,
    OneSignal_APP_KEY
} = process.env;

assert(PORT, 'PORT is required');
assert(HOST, 'HOST is required');

module.exports = {
    port: PORT,
    host: HOST,
    url: HOST_URL,
    jwtoken: JWT_SECRET,
    firebaseConfig: {
        apiKey: API_KEY,
        authDomain: AUTH_DOMAIN,
        projectId: PROJECT_ID,
        storageBucket: STORAGE_BUCKET,
        messagingSenderId: MESSAGING_SENDER_ID,
        appId: APP_ID
    },
    onesignalConfig: {
        appId: OneSignal_APP_ID,
        appKey: OneSignal_APP_KEY,
    }
}