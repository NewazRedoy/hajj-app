import 'package:first_app/screen/ElectedQuestionSubTopicPage.dart';
import 'package:flutter/material.dart';

class ElectedQuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("নির্বাচিত প্রশ্নোত্তর"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 7.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ElectedQuestionSubtopic()));
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.amber),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          index.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.amber),
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ]),
              ));
        },
      ),
    );
  }
}
