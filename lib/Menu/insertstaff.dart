
import 'package:drmobileadmin/Menu/insertemergency.dart';
import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertStaff extends StatefulWidget {
  @override
  _insertStaffState createState() => _insertStaffState();
}

DatabaseService db = DatabaseService();
TextEditingController reg_no = new TextEditingController();
TextEditingController stafftype = new TextEditingController();
TextEditingController name = new TextEditingController();
TextEditingController image = new TextEditingController();
TextEditingController location = new TextEditingController();
TextEditingController fee = new TextEditingController();


class _insertStaffState extends State<insertStaff> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Insert Staff"),
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
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("Staff type"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: stafftype,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "staff type",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Location"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: location,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "location",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               

              Text("fee"),
               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: fee,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Fee",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: reg_no,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Reg no",
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
                      labelText: "image link",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (name.text == '' || stafftype.text == '' || reg_no.text == '' || location.text == '' || fee.text == '' || image.text == '') {
                      _showDialogEmptyinsertStaff();
                    } else {
                      var res = await db.insertstaff(
                          "reg", name.text, stafftype.text, location.text, fee.text, reg_no.text, image.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertStaff() {
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
