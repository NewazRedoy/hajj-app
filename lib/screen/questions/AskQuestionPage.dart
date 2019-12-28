import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:flutter/material.dart';

class AskQuestionPage extends StatefulWidget {
  @override
  _AskQuestionPageState createState() => _AskQuestionPageState();
}

class _AskQuestionPageState extends State<AskQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("প্রশ্ন করুন"),
        actions: <Widget>[SearchSettings(),],
      ),
      body:  Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: "প্রশ্নের বিষয় উল্লেখ করুন (যেমনঃ ইহরাম, তাওয়াফ, সা'ঈ)"),
                      ),
                      TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintText: "আপনার দু'আ এখানে লেখুন..."),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 140.0,
            ),
            Center(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: <Widget>[
                          RotatedBox( quarterTurns: 3,
                              child: Icon(Icons.send)),
                          SizedBox(
                            height: 12,
                          ),
                          Text("পাঠিয়ে দিন")
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),

    );
  }
}
