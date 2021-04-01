import 'package:drmobileadmin/database.dart';
import 'package:flutter/material.dart';

class insertMedicine extends StatefulWidget {
  @override
  _insertMedicineState createState() => _insertMedicineState();
}

DatabaseService db = DatabaseService();
TextEditingController generic_name = new TextEditingController();
TextEditingController description = new TextEditingController();
TextEditingController brand_name = new TextEditingController();
TextEditingController images = new TextEditingController();
TextEditingController quantity = new TextEditingController();
TextEditingController price = new TextEditingController();
TextEditingController company = new TextEditingController();
TextEditingController tags = new TextEditingController();


class _insertMedicineState extends State<insertMedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Insert medicine"),
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
              Text("Brand Name"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: brand_name,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "brand_name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              Text("generic_name"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: generic_name,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "generic name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Company"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: company,
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: "Company",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               
               SizedBox(
                height: 20,
              ),
              Text("price"),
               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: price,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               SizedBox(
                height: 20,
              ),
                     Text("quantity"),
              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: quantity,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "quantity",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
                 SizedBox(
                height: 20,
              ),
                   SizedBox(
                height: 20,
              ),
                     Text("description"),
               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: description,
                  maxLines: 2,
                  decoration: InputDecoration(
                      labelText: "description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

                  

                SizedBox(
                height: 20,
              ),
               Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: tags,
                  maxLines: 4,
                  decoration: InputDecoration(
                      labelText: "tags",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),

              Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: images,
                  maxLines: 5,
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
                    if (brand_name.text == '' || generic_name.text == '' || company.text == '' || price.text == '' || quantity.text == '' || description.text == '' || tags.text == '' || images.text == '' ) {
                      _showDialogEmptyinsertMedicine();
                    } else {
                      var res = await db.insertMedicine(
                          "M3", brand_name.text, generic_name.text, company.text, price.text, quantity.text, description.text, tags.text, images.text);
                    }
                  })
            ],
          )
        ]));
  }

  _showDialogEmptyinsertMedicine() {
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

