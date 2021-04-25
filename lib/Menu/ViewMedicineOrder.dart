import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/invitation.dart';
import 'package:drmobileadmin/module/viewMedicineOrder.dart';
import 'package:flutter/material.dart';

class viewMedicineOrders extends StatefulWidget {
  @override
  _viewMedicineOrdersState createState() => _viewMedicineOrdersState();
}

class _viewMedicineOrdersState extends State<viewMedicineOrders> {
  DatabaseService db = DatabaseService();
  List<Medicine_order> medicineorderList = new List();
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

          offset = medicineorderList.length;
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
         title: Text("Items Order"),

          ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: medicineorderList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Colors.white54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Medicine Orders",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 22),
                ),
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
                            "Medicine ID:${medicineorderList[index].med_id}\nMedicine Name:${medicineorderList[index].userName}\nUser Contact: ${medicineorderList[index].user_contact}\nOrder ID: ${medicineorderList[index].order_id}",
                          ))),
                ]),
                Row(children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                        width: 100,
                        height: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                  "Order By(user ID):${medicineorderList[index].user_id}"),
                              Container(
                                child: RaisedButton(
                                    child: Text("Delete"),
                                    color: Colors.orange,
                                         onPressed: () async {
                                  if (medicineorderList[index].user_id == '') {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                          title: Text("user Id is absense")),
                                    );
                                  } else {
                                    var res = await db.deleteMedicineOrder(
                                       medicineorderList[index].med_id);
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

    var data = await db.med_order();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Medicine_order p in data) {
        medicineorderList.add(p);
      }
    });
  }
}
