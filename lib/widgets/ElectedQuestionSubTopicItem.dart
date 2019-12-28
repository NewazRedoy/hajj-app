import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:flutter/material.dart';

class ElectedQuestionSubTopicListItem extends StatelessWidget {
  QuestionDetail questionsubtopic;

  ElectedQuestionSubTopicListItem(
    this.questionsubtopic,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        elevation: 5.0,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              questionsubtopic.questiontopic,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              questionsubtopic.answer,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ]),
      ),
    );
  }
}
