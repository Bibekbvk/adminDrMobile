import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/invitation.dart';
import 'package:drmobileadmin/module/prescription.dart';
import 'package:flutter/material.dart';

class presOrder extends StatefulWidget {
  @override
  _presOrderState createState() => _presOrderState();
}

class _presOrderState extends State<presOrder> {
  DatabaseService db = DatabaseService();
  List<Prescriptions> presList  = new List();
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

          offset = presList.length;
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
       title: Text("View Prescription"),
             
           

          ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: presList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Prescription"),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 150,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          borderRadius: BorderRadius.circular(22)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          child: Text(
                            "Prescription ID:${presList[index].Pres_id}\nName/uid:${presList[index].user_id}\nContact No: ${presList[index].contact}\n}",
                          ))),
                ]),
                Row(children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "Provider Name:${presList[index].user_id}\n\n"),
                                  Text("<<<Prescription Image>>>"),
                                  Container(
                                   height: 300,
                                   width: 300,
                                    child: Image.network(presList[index].imgUrl),
                                  ),
                              Container(
                                child: RaisedButton(
                                    child: Text("Delete"),
                                    color: Colors.orange,
                                    onPressed: () async {
                                      var res = await db.deletepres(
                                          presList[index].Pres_id);
                                    }),
                              ),
                              Divider(
                                color: Colors.greenAccent,
                                height: 2,
                                thickness: 2,
                              )
                            ])),
                  ),
                ]),
              ],
            ),
          );
        },
      ),
    );
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.viewPrescription();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Prescriptions p in data) {
        presList.add(p);
      }
    });
  }
}
