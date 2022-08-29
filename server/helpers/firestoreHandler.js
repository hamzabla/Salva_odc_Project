const config = require('./config');


const { initializeApp, applicationDefault, cert } = require('firebase-admin/app');
const { getFirestore, Timestamp, FieldValue } = require('firebase-admin/firestore');

const { getStorage } = require('firebase-admin/storage');

const serviceAccount = require('../serviceAccountKey/serviceAccountKey.json');

initializeApp({
  credential: cert(serviceAccount)
});

const db = getFirestore();

const fileStorage = getStorage();

//fileStorage.bucket().storage().ref('img').put(file).then()


module.exports = {db};