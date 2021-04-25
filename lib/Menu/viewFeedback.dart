import 'package:drmobileadmin/constant.dart';
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

          title: Text("View Feedbacks"),
          //  leading: TextField(

          //  ),

          ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: feedbackList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Feedback Provided"),
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 0),
                          borderRadius: BorderRadius.circular(22)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          child: Text(
                            "${feedbackList[index].feedback}",
                          ))),
                ]),
                Row(children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                        width: 300,
                        height: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Provider Name:${feedbackList[index].Name}"),
                              Text("By user:${feedbackList[index].UID}"),
                              Text("Contact:${feedbackList[index].contact}"),
                              Container(
                                child: RaisedButton(
                                    child: Text("Delete"),
                                    color: Colors.orange,
                                   onPressed: () async {
                                  if (feedbackList[index].UID == '') {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: Text("user Id is absense")),
                                    );
                                  } else {
                                    var res = await db.deletestaffsReg(
                                       userid);
                                    print("${res}ressss");

                                    if (res == 200) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: Text("Successfully deleted ")),
                                      );

                                      print("success");
                                    } else {
                                      print("failure");
                                    }
                                  }
                                },),
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
