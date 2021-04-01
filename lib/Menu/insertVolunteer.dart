
import 'package:drmobileadmin/Menu/insertemergency.dart';
import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insert_Volunter extends StatefulWidget {
  @override
  _insert_VolunterState createState() => _insert_VolunterState();
}

DatabaseService db = DatabaseService();
TextEditingController contact = new TextEditingController();
TextEditingController type = new TextEditingController();
TextEditingController name = new TextEditingController();
TextEditingController image = new TextEditingController();
TextEditingController details = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController fee = new TextEditingController();


class _insert_VolunterState extends State<insert_Volunter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Insert Volunteer"),
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
                      labelText: "Name",
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
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "contact",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               

              Text("Type"),
               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: type,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "type",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

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

                  Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: email,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: image,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "image",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (name.text == '' || location.text == '' || contact.text == '' || type.text == '' || details.text == '' || email.text == '' || image.text == '') {
                      _showDialogEmptyinsert_Volunter();
                    } else {
                      var res = await db.insertVolunteer(
                          "vol", name.text, location.text, contact.text, type.text, details.text, email.text, image.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsert_Volunter() {
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
            "Some Fields are empty",
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
