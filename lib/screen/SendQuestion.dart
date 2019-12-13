import 'package:flutter/material.dart';

class SendQuestion extends StatefulWidget {
  @override
  _SendQuestionState createState() => _SendQuestionState();
}

class _SendQuestionState extends State<SendQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("প্রশ্ন করুন"),
      ),
      body: ListView(
          children: <Widget>[
            Container(
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (text) {
                        print(text);
                      },
                    ),
                    TextField(
                      maxLines: 8,
                      onChanged: (text) {
                        print(text);
                      },
                    ),
                  ],
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
                    onTap: () {},
                    child: Container(
                      height: 130.0,
                      width: 130.0,
                      alignment: Alignment.bottomCenter,
                      child: Text("পাঠিয়ে দিন"),
                    ),
                  )),
            ),
          ],
        ),

    );
  }
}
