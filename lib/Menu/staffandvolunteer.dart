import 'package:drmobileadmin/Menu/ViewVolunteerRegistration.dart';
import 'package:drmobileadmin/Menu/viewStaffRegistration.dart';
import 'package:flutter/material.dart';

class volunteerAnd extends StatefulWidget {
  @override
  _volunteerAndState createState() => _volunteerAndState();
}

class _volunteerAndState extends State<volunteerAnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [

        SizedBox(height:40),
        Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.amberAccent),
                child: Text(
                  "View Staff Registration",
                  style: TextStyle(fontSize: 26),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewStaffRegistration()));
              },
            ),
            SizedBox(height: 26),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.amberAccent),
                child: Text("View volunteer Registration",
                    style: TextStyle(fontSize: 23)),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => viewvolunteerRegistration()));
              },
            )
          ],
        ),
      ]),
    );
  }
}
