
import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/staffRegistration.dart';

import 'package:flutter/material.dart';

class viewStaffRegistration extends StatefulWidget {
  @override

  _viewStaffRegistrationState createState() => _viewStaffRegistrationState();
}

class _viewStaffRegistrationState extends State<viewStaffRegistration> {
  DatabaseService db = DatabaseService();
  List<StaffsReg> staffsReg = new List();
  ScrollController _scrollController = new ScrollController();



  int offset = 0;
  
  int currentDataLength = 0;

  @override
  void initState() {


    super.initState();
    fetch(offset);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentDataLength >= 10) {
          print("List bigger than 10");

          offset = staffsReg.length;
          fetch(offset);
        }

        print("called again");
        print(" OFFSET $offset  CURRENT VALUE $currentDataLength");
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      //  leading: TextField(

      //  ),

       ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: staffsReg.length,
        itemBuilder: (BuildContext context, int index) {
        
         return Container(
           
           padding: EdgeInsets.all(10),
           color: Colors.black54,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
            children: [
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                                children:[ 
                                  Container(

                                  child: Text("${staffsReg[index].description}"),


                                  ),

                                  Container(
                                    padding: EdgeInsets.all(5
                                    ),
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                  border:Border.all(color: Colors.green, width: 4),
                  borderRadius: BorderRadius.circular(22)
                  ),
                  child: Image.network(staffsReg[index].image1,  fit: BoxFit.cover )
               ),
             
                           

                                 ] ),
             
                 Expanded(
                   flex:7,
                    child: Container(
                     width: 150,
                     height: 200,
                   child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children:[ 
                           
                            Text("Fees/day:${staffsReg[index].description}"),
                         
                         
                         Container(
                           child: RaisedButton(
                             child:Text("Buy"),
                             color: Colors.orange,
                             onPressed: (){

                               //print("Name:${medList[index].generic_name}");
                             },
                           ),
                         ),
                             Divider(
                               color: Colors.greenAccent,
                               height: 2,
                               thickness: 2,
                             ) 
                     ]
                               
                    
                   )
               ),
                 ),
             
              
            ],

            
          
             
           ),
             
        
         );
     
        
        },
      ),
    );


  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.staffResgis();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (StaffsReg p in data) {
        staffsReg.add(p);
      }
    });
  }
}
