import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/invitation.dart';
import 'package:drmobileadmin/module/viewMedicineOrder.dart';
import 'package:flutter/material.dart';



class viewMedicineOrders extends StatefulWidget {
  @override
  

  

  _viewMedicineOrdersState createState() => _viewMedicineOrdersState();
}

class _viewMedicineOrdersState extends State<viewMedicineOrders> {
  DatabaseService db = DatabaseService();
  List<Medicine_order> medicineorderList = new List();
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

          offset = medicineorderList.length;
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
        itemCount: medicineorderList.length,
        itemBuilder: (BuildContext context, int index) {
        
         return Container(
           
           padding: EdgeInsets.all(10),
           color: Colors.black54,
            child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,        
            children: [
               Text("Invited Staff"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                                children:[ 
                                  Container(
                                    padding: EdgeInsets.all(5
                                    ),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                  border:Border.all(color: Colors.green, width: 0),
                  borderRadius: BorderRadius.circular(22)
                  ),
                  child: ClipRRect( 
                    
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    child: Text("StaffID:${medicineorderList[index].med_id}  \n Name:${medicineorderList[index].userName} \n Contact No: ${medicineorderList[index].user_contact} \n  Invitation ID: ${medicineorderList[index].order_id}}", ))
               ),
             
                 
                           

                                 ] ),
             
                 Row(
                                    children:[ Expanded(
                     flex:7,
                      child: Container(
                       width: 300,
                       height: 300,
                     child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children:[ 
                              Text("Provider Name:${medicineorderList[index].user_id}"),
                             
                           
                          

                             Container(
                             child: RaisedButton(
                               child:Text("Delete"),
                               color: Colors.orange,
                                 onPressed: () async {
                     
                        var res = await db.deleteInvitation(medicineorderList[index].med_id
                            );
                      
                    }
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
                                     ] ),
             
              
            ],

            
          
             
           ),
             
        
         );
     
        
        },
      ),
    );


  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.med_order();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Medicine_order p in data) {
        medicineorderList.add(p);
      }
    });
  }
}
