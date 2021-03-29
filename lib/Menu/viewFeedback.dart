import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:flutter/material.dart';



class feedbackPage extends StatefulWidget {
  @override
  

  

  _feedbackPageState createState() => _feedbackPageState();
}

class _feedbackPageState extends State<feedbackPage> {
  DatabaseService db = DatabaseService();
  List<Feedbacks> feedbackList = new List();
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

          offset = feedbackList.length;
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
        itemCount: feedbackList.length,
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
                                    padding: EdgeInsets.all(5
                                    ),
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                  border:Border.all(color: Colors.green, width: 4),
                  borderRadius: BorderRadius.circular(22)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(feedbackList[index].Name,  fit: BoxFit.cover ))
               ),
             
                  Container(
                     width:70,
                     child:Text("${feedbackList[index].feedback}", style: TextStyle(
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
                            Text("Name:${feedbackList[index].UID}"),
                            Text("Fees/day:${feedbackList[index].contact}"),
                            Text("Location:${feedbackList[index].Name}"),
                         
                        

                           Container(
                           child: RaisedButton(
                             child:Text("Delete"),
                             color: Colors.orange,
                               onPressed: () async {
                   
                      var res = await db.deleteFeedback(feedbackList[index].UID
                          );
                    
                  }
                           ),
                         ),


                           Container(
                           child: RaisedButton(
                             child:Text("Update"),
                             color: Colors.orange,
                               onPressed: () async {
                   
                   
                    
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
             
              
            ],

            
          
             
           ),
             
        
         );
     
        
        },
      ),
    );


  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.feedbacks();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Feedbacks p in data) {
        feedbackList.add(p);
      }
    });
  }
}
