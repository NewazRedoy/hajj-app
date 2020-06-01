import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/provider/DataProvider.dart';

class QuestionAnswerDetailItem extends StatelessWidget {
  QuestionDetail questionanswer;

  QuestionAnswerDetailItem(
    this.questionanswer,
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
        elevation: 1.5,
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              questionanswer.question,
              style: TextStyle(fontSize: DataProvider.of(context).banglaFontSize, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              questionanswer.answer,
              style: TextStyle(fontSize: DataProvider.of(context).banglaFontSize),
            ),
          ),
        ]),
      ),
    );
  }
}
