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
  signout()async{
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, LandingPage.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

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
