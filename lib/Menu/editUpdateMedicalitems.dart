import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/medicalItem.dart';
import 'package:flutter/material.dart';

class medicalItemList extends StatefulWidget {
  @override
  _medicalItemListState createState() => _medicalItemListState();
}

class _medicalItemListState extends State<medicalItemList> {
  DatabaseService db = DatabaseService();
  List<MedicalItem> medicalItemList = new List();
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

          offset = medicalItemList.length;
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
        title: Text("Medical items"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: medicalItemList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Colors.white10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      height: 120,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 4),
                          borderRadius: BorderRadius.circular(22)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(medicalItemList[index].images,
                              fit: BoxFit.cover))),
                  Container(
                    width: 100,
                    child: Text(
                      "${medicalItemList[index].otherName}",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
                    width: 70,
                    child: Text(
                      "${medicalItemList[index].quantity}",
                      style: TextStyle(
                          fontSize: 8,
                          color: Colors.lightGreen,
                          fontWeight: FontWeight.w800),
                    ),
                  )
                ]),
                Expanded(
                  flex: 7,
                  child: Container(
                      width: 150,
                      height: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${medicalItemList[index].name}"),
                            Text("${medicalItemList[index].price}"),
                            Text("Company:${medicalItemList[index].company}"),
                            Text("ID:${medicalItemList[index].itm_id}"),
                            Container(
                              child: RaisedButton(
                                child: Text("Delete"),
                                color: Colors.orange,
                                onPressed: () async {
                                  if (medicalItemList[index].itm_id == '') {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: Text("user Id is absense")),
                                    );
                                  } else {
                                    var res = await db.deleteMedicalItems(
                                       medicalItemList[index].itm_id);
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
                                }
                                
                              ),
                            ),
                            Divider(
                              color: Colors.greenAccent,
                              height: 2,
                              thickness: 2,
                            )
                          ])),
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

    var data = await db.medical();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (MedicalItem p in data) {
        medicalItemList.add(p);
      }
    });
  }
}
