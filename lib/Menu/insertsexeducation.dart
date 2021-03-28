
import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertsexeducation extends StatefulWidget {
  @override
  _insertsexeducationState createState() => _insertsexeducationState();
}

DatabaseService db = DatabaseService();
TextEditingController article1 = new TextEditingController();
TextEditingController contact = new TextEditingController();
TextEditingController topic = new TextEditingController();
TextEditingController image1 = new TextEditingController();
TextEditingController article2 = new TextEditingController();
TextEditingController image2 = new TextEditingController();
TextEditingController date = new TextEditingController();


class _insertsexeducationState extends State<insertsexeducation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" insert SexEducation"),
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
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Topic",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("Article 1"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: article1,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Article 1",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Date"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: date,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "Date",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: image1,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "Image1",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: article2,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "article2",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

                  Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: image2,
                  maxLines: 10,
                  decoration: InputDecoration(
                      labelText: "image2",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              FlatButton.icon(
                  icon: Icon(Icons.send_outlined),
                  label: Text("Send"),
                  onPressed: () async {
                    if (topic.text == '') {
                      _showDialogEmptyinsertsexeducation();
                    } else {
                      var res = await db.insertSexEducation(
                          topic.text, article1.text, date.text, image1.text, article2.text, image2.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertsexeducation() {
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
            "insertsexeducation is Empty",
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
