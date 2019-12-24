import 'package:flutter/material.dart';

class SendQuestionPage extends StatefulWidget {
  @override
  _SendQuestionPageState createState() => _SendQuestionPageState();
}

class _SendQuestionPageState extends State<SendQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("প্রশ্ন করুন"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          labelText: 'Title',
                          hintText: "hint"),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          labelText: 'Description',
                          hintText: "hint"),
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
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.send),
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
