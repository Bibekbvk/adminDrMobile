
import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertHelp extends StatefulWidget {
  @override
  _insertHelpState createState() => _insertHelpState();
}

DatabaseService db = DatabaseService();

TextEditingController topic = new TextEditingController();
TextEditingController image = new TextEditingController();

TextEditingController details = new TextEditingController();


class _insertHelpState extends State<insertHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inset Help"),
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
              Text("Topic"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: topic,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "Topic",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("Image"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: image,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Image",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Details"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: details,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "Details",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

                
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (topic.text == '' || image.text == '' || details.text == '') {
                      _showDialogEmptyinsertHelp();
                    } else {
                      var res = await db.inserthelp(
                          topic.text, image.text, details.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertHelp() {
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
            "insertHelp is Empty",
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
