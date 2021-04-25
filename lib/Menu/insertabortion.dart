import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertAbortion extends StatefulWidget {
  @override
  _insertAbortionState createState() => _insertAbortionState();
}

DatabaseService db = DatabaseService();

TextEditingController name = new TextEditingController();
TextEditingController location = new TextEditingController();

TextEditingController contact = new TextEditingController();
TextEditingController details = new TextEditingController();
TextEditingController images = new TextEditingController();

class _insertAbortionState extends State<insertAbortion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inset Abortion"),
          actions: [Icon(Icons.feedback_rounded)],
        ),
        body: ListView(children: [
          Container(
              child: Text(
            "Insert Here......",
            style: TextStyle(color: Colors.greenAccent.shade700, fontSize: 22),
          )),
          Column(
            children: [
              Text("Name"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: name,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("location"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: location,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("contact"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: contact,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "contact",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("details"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: details,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "details",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("images"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: images,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "images",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (name.text == '' ||
                        location.text == '' ||
                        contact.text == '' ||
                        details.text == '' ||
                        images.text == '') {
                      _showDialogEmptyinsertAbortion("Some field are empty");
                    } else {
                     
                      var res = await db.insertabortion(
                          "ID",
                          name.text,
                          location.text,
                          contact.text,
                          details.text,
                          images.text);
                         
                          print(res);
                            if(res==200){
                          _showDialogEmptyinsertAbortion("Successfully Inserted staff");
                            }else{
                           
                            _showDialogEmptyinsertAbortion("Something Went Wrong");

                            }

                          
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertAbortion(String Message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            "Message",
            style: TextStyle(color: Colors.purple[400], fontSize: 14),
          ),
          content: new Text(
            "$Message",
            style: TextStyle(color: Colors.purple[400], fontSize: 14),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
