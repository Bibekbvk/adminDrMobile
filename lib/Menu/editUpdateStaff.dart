
import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Staff.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class staffListPage extends StatefulWidget {
  @override
  

  staffListPage();

  _staffListPageState createState() => _staffListPageState();
}

class _staffListPageState extends State<staffListPage> {
  DatabaseService db = DatabaseService();
  List<Staffs> staffList = new List();
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

          offset = staffList.length;
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
      appBar: AppBar(),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: staffList.length,
        itemBuilder: (BuildContext context, int index) {
         return Container(
           padding: EdgeInsets.all(10),
           color: Colors.black54,
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                                children:[ 
                                  Container(
                                    padding: EdgeInsets.all(5
                                    ),
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                  border:Border.all(color: Colors.green, width: 4),
                  borderRadius: BorderRadius.circular(22)
                  ),
                  child: Image.network(staffList[index].photo,  fit: BoxFit.fill )
               ),
               Container(
                 width:100,
                  child:Text("${staffList[index].name}", style: TextStyle(
                    fontSize: 12, color:Colors.lightGreen, fontWeight:FontWeight.w300
                  ),),
               ),
                  Container(
                     width:70,
                     child:Text("${staffList[index].staff_type}", style: TextStyle(
                    fontSize: 8, color:Colors.lightGreen, fontWeight:FontWeight.w800
                  ),),
                  )
                           

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
                            Text("Name:${staffList[index].reg_no}"),
                            Text("Fees/day:${staffList[index].fee}"),
                            Text("Location:${staffList[index].location}"),
                         
                         Container(
                           child: RaisedButton(
                             child:Text("Edit"),
                             color: Colors.orange,
                             onPressed: (){

                               print("Name:${staffList[index].reg_no}");
                             },
                           ),
                         ),
                            

                                    Container(
                           child: RaisedButton(
                             child:Text("Delete"),
                             color: Colors.orange,
                            

                                              onPressed: () async {
                   
                      var res = await db.deletestaff(staffList[index].staff_id
                          );
                    
                  
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

  fetch( int offset) async {
    print("in fetch");

    var data = await db.staff();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Staffs p in data) {
        staffList.add(p);
      }
    });
  }
}
