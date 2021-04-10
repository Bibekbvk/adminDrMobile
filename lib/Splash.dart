import 'dart:async';

import 'package:drmobileadmin/Menu/adminlogin.dart';
import 'package:drmobileadmin/home.dart';
import 'package:flutter/material.dart';


class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      //this page will be displayed for 3 seconds and moves to home screen.
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              "Dr. Mobile", // This Text will appear in the screen for 3 seconds.
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            ),
          ),
         // Container(
           //   height: 300, width: 300, child: Image.asset('images/dr.png'))
        ]),
      ),
    );
  }
}
