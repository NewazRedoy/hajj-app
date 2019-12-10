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
        title: Text("Hajj App-guide"),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        child: Column(
              children: <Widget>[

                  TextField(
                    onChanged: (text){
                      print(text);
                    },
                  ),
                TextField(
                  maxLines: 5,
                  onChanged: (text){
                    print(text);
                  },
                ),
              ],
        ),
      ),
    );
  }
}
