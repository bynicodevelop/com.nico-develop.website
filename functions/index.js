const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.duplicateUser = functions.auth.user().onCreate(
  async (user) =>
    await admin.firestore().collection("users").doc(user.uid).set({
      first_visits: admin.firestore.FieldValue.serverTimestamp(),
    })
);
