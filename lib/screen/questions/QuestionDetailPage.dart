import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class QuestionDetailPage extends StatelessWidget {
  QuestionDetail questionanswer;

  QuestionDetailPage(this.questionanswer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 1.5,
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    questionanswer.question,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    questionanswer.answer,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
