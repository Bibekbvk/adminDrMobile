import 'package:drmobileadmin/database.dart';
import 'package:drmobileadmin/module/Feedback.dart';
import 'package:drmobileadmin/module/Medicine.dart';
import 'package:drmobileadmin/module/invitation.dart';
import 'package:drmobileadmin/module/question.dart';
import 'package:flutter/material.dart';

class replyQuestion extends StatefulWidget {
  @override
  _replyQuestionState createState() => _replyQuestionState();
}

class _replyQuestionState extends State<replyQuestion> {
  DatabaseService db = DatabaseService();
  List<Question> replyQuestionList = new List();
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

          offset = replyQuestionList.length;
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
  TextEditingController questionController = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Answer"),
             
           

          ),
         body: ListView.builder(
        controller: _scrollController,
        itemCount: replyQuestionList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 300,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "By:User_ID:${replyQuestionList[index].u_id}",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "Question unique no.:${replyQuestionList[index].q_id}",
                            style: TextStyle(fontSize: 22),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Question:${replyQuestionList[index].question}",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.amberAccent.shade100,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Answer:${replyQuestionList[index].answer}",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                            Text("Please write reply in the text box below "),
                             Container(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: questionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: "Please Write answer here",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11))),
                ),
              ),
               Container(
        padding: EdgeInsets.all(20),
        child: RaisedButton(
          color: Colors.blueAccent,
          child: Text("Send Answer"),
        onPressed: () async {
                    if (questionController.text == '') {
                      showDialogEmptyFeedback();
                    } else {
                      var res = await db.answer(questionController.text,replyQuestionList[index].q_id );
                      print("${res}ressss");

                      if (res == 200) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text(
                                  "Successfully send to admin, please view in my activities to see the answer")),
                        );

                        print("success");
                      } else {
                        print("failure");
                      }
                    }
                  },
          
          ),
      ),
                         
                          Divider(
                            color: Colors.greenAccent,
                            height: 2,
                            thickness: 2,
                          )
                        ])),
              ],
            ),
          );
        },
      ),
    );
  }

  fetch(int offset) async {
    print("in fetch");

    var data = await db.questions();
    currentDataLength = data.length;
    print("below data");

    print("out of loop");

    setState(() {
      for (Question p in data) {
        replyQuestionList.add(p);
      }
    });
  }
showDialogEmptyFeedback() {
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
            "Answer is Empty",
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
