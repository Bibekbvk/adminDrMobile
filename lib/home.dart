import 'package:drmobileadmin/Menu/editUpdateMedicalitems.dart';
import 'package:drmobileadmin/Menu/editUpdateMedicine.dart';
import 'package:drmobileadmin/Menu/editUpdateStaff.dart';
import 'package:drmobileadmin/Menu/editUpdateVolunteer.dart';
import 'package:drmobileadmin/Menu/insertVolunteer.dart';
import 'package:drmobileadmin/Menu/insertemergency.dart';
import 'package:drmobileadmin/Menu/inserthelp.dart';
import 'package:drmobileadmin/Menu/insertstaff.dart';
import 'package:flutter/material.dart';

import 'Menu/insertMedicine.dart';
import 'Menu/insertabortion.dart';
import 'Menu/insertsexeducation.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
         Container(
         child:  Icon(Icons.medical_services, size: 88,)
         ),
         
         Column(children: [
             RaisedButton(
             onPressed: (){


             },
             child: Text("View Medicine Order")
              
             ),

              RaisedButton(
             onPressed: (){


             },
             child: Text("View Prescrption order")
              
             ),

              RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>insertMedicine()));

             },
             child: Text("Insert Medicine")
              
             )

         ],)


         ],

        ),


                Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
         Container(
         child:  Icon(Icons.local_hospital_outlined, size: 88,)
         ),
         
         Column(children: [
             RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>insertStaff()));



             },
             child: Text("Insert Staff")
              
             ),
            


             RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>insertAbortion()));



             },
             child: Text("Insert abortion")
              
             ),
              RaisedButton(
             onPressed: (){

              Navigator.push(context, MaterialPageRoute( builder: (context)=>insert_Volunter()));
             },
             child: Text("Insrert volunteer")
              
             ),

              RaisedButton(
             onPressed: (){


             },
             child: Text("view staff/  \n volunteer Registration")
              
             ),

              RaisedButton(
             onPressed: (){
                  Navigator.push(context, MaterialPageRoute( builder: (context)=>insertEmergency()));

             },
             child: Text("Insert Emergency")

              
             ),
               
                RaisedButton(
             onPressed: (){

                Navigator.push(context, MaterialPageRoute( builder: (context)=>insertHelp()));

             },
             child: Text("Insert help")
              
             ),

              RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>insertsexeducation()));

             },
             child: Text("Insert Sex education")
              
             ),

         ],)


         ],

        ),


                Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
         Container(
         child:  Icon(Icons.insert_chart, size: 88,)
         ),
         
         Column(children: [
             RaisedButton(
             onPressed: (){


             },
             child: Text("View Invitation")
              
             ),

              RaisedButton(
             onPressed: (){


             },
             child: Text("View Medical item Order")
              
             ),

              RaisedButton(
             onPressed: (){


             },
             child: Text("Insert Medical item")
              
             )

         ],)


         ],

        ),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
        
         
         Column(children: [
             RaisedButton(
             onPressed: (){


             },
             child: Text("View Feedback")
              
             ),

              RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>volunteer()));

             },
             child: Text("View/Update/delete volunteer")
              
             ),

              RaisedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute( builder: (context)=>staffListPage()));

             },
             child: Text("view/ Update / delete Staff")
              
             ),

             RaisedButton(
             onPressed: (){
              Navigator.push(context, MaterialPageRoute( builder: (context)=>medicineList()));


             },
             child: Text("view/ Update / delete medicine")
              
             ),

              RaisedButton(
             onPressed: (){
                 Navigator.push(context, MaterialPageRoute( builder: (context)=>medicalItemList()));

             },
             child: Text("view/ Update / delete medical item")
              
             )

         ],)


         ],

        )
      
         




      ],),
      
    );
  }
}