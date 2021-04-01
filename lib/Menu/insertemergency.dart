
import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertEmergency extends StatefulWidget {
  @override
  _insertEmergencyState createState() => _insertEmergencyState();
}

DatabaseService db = DatabaseService();

TextEditingController name = new TextEditingController();
TextEditingController contact1 = new TextEditingController();

TextEditingController contact2 = new TextEditingController();

TextEditingController location = new TextEditingController();

class _insertEmergencyState extends State<insertEmergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Insert emergency"),
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
              Text("name"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: name,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("Contact1"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: contact1,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "contact1",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("contact2"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: contact2,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "contact2",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               SizedBox(
                height: 20,
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
                
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (name.text == '' || contact1.text == '' || contact2.text == '' || location.text == '') {
                      _showDialogEmptyinsertEmergency();
                    } else {
                      var res = await db.insertemergency("Bibek",
                          name.text, contact1.text, contact2.text, location.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertEmergency() {
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
            "Some Fields Are empty",
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
