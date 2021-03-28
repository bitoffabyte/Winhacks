import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../LandingPage.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  var color1 = Color(0xff0050F5);
  var user1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verify1();
  }

  verify1()async{
    await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser.uid).get().then((user) {
      if(user["Type"]=="Admin"){
        FirebaseFirestore.instance.collection("Vendors").get().then((querySnapshot) {
          querySnapshot.docs.forEach((result) {
            FirebaseFirestore.instance
                .collection("Vendors")
                .doc("SRMT")
                .collection("SRMT")
                .get()
                .then((querySnapshot) {
              querySnapshot.docs.forEach((result) {
                if(result["CreatedBY"] == _auth.currentUser.uid){
                  print("PRESENT");
                  print(result["StoreName"]);
                  setState(() {
                    user1 = result.data();
                  });



                }

              });
            });
          });
        });
      }


    });
  }


  signout()async{
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, LandingPage.id);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if(user1!=null)
            Text("${user1["StoreName"]}"),

          RaisedButton(
              child: Icon(Icons.logout,color: Colors.white,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              color: color1,
              onPressed: () {
                signout();
              }),
        ],
      ),
    );
  }
}
