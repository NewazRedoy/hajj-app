import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:flutter/material.dart';

class ElectedQuestionSubtopic extends StatelessWidget {
  final QuestionSubtopic catechism;

  const ElectedQuestionSubtopic({Key key, @required this.catechism})
      : super(key: key);

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
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 5.0,
            child: Column(children: <Widget>[
              Container(
                height: 50.0,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  catechism.questiontopic,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(),
              Container(
                height: 100.0,
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  catechism.answer,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
