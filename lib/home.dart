import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_project/login.dart';
import 'package:phone_auth_project/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid;
  String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Column(

        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 50, left: 300, bottom: 50),
              child: IconButton(
                icon: Icon(Icons.logout),
                iconSize: 30,
                color: MyColors.primaryPink,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
                },
              )),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Congrats!! \nYour phone number just got verified. \nWelcome user $number",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: MyColors.primaryBlue,
                ),
              )),
          Center(
            child: Container(
                constraints: const BoxConstraints(maxHeight: 200),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 100),
                child: Image.asset(
                  'assets/2.png',
                  color: MyColors.primaryPink,
                )),
          ),
        ],
      ),
    );
  }

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     uid = FirebaseAuth.instance.currentUser.uid;
     number = FirebaseAuth.instance.currentUser.phoneNumber;
   }
}
