let firebaseConfig = {
    apiKey: "AIzaSyC4wMUSGA-MhWZlajJLyvPiPQTLXkfnz4E",
    authDomain: "vibranium-a5678.firebaseapp.com",
    projectId: "vibranium-a5678",
    storageBucket: "vibranium-a5678.appspot.com",
    databaseURL: "https://vibranium-a5678.firebaseio.com",
    messagingSenderId: "758359603082",
    appId: "1:758359603082:web:67cad1fbb5b7db36573a73",
    measurementId: "G-BLXKVNRNJC"
};

firebase.initializeApp(firebaseConfig);

const db = firebase.firestore();

const users = db.collection('users')

// users
//   .get()
//   .then((snapshot) => {
//     const data = snapshot.docs.map((doc) => ({
//       id: doc.id,
//       ...doc.data(),
//     }));
//     console.log(data); 
// });

let adder = (email, username, type, address) => {
    let id_promise = users.add({});
    id_promise.then((snapshot) => {
        users.doc(`${snapshot.id}`)
        .set({
            "ID" : snapshot.id,
            "Type" : "Admin",
            "email" : email,
            "username" : username,
            "Package" : type,
            "Address" : address
        })
        .then(doc => {
            alert("Your Account has been Created");
        })
    });
}

const email = document.querySelector("input[type='mail']");
const user = document.querySelector("input[type='text']");
const addr = document.querySelector("textarea");
const check = document.querySelectorAll("input[type='radio']");

const sbmt = document.querySelector("button");

sbmt.addEventListener('click', () => {
    let type = 0;
    for(let i = 0;i < check.length;i++){
        if(check[i].checked)
            break;
        type++;
    }
    switch(type){
        case 0:
            type = "Platinum";
            break;
        case 1:
            type = "Gold";
            break;
        case 2:
            type = "Silver";
            break;
    }
    adder(email.value, user.value, type, addr.value);
});