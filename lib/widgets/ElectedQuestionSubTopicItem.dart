import 'package:flutter/material.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';

class ElectedQuestionSubTopicListItem extends StatelessWidget {

  QuestionSubtopic questionsubtopic;

  ElectedQuestionSubTopicListItem(this.questionsubtopic,);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: Column(children: <Widget>[
        Container(
          height: 50.0,
          padding: const EdgeInsets.all(6.0),
          child: Text(
            questionsubtopic.questiontopic,
            style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Divider(),
        Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            questionsubtopic.answer,
            style: TextStyle(fontSize: 14.0),
          ),
        ),
      ]),
    );
  }
}