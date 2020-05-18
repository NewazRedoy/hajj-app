import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/screen/questions/QuestionDetailPage.dart';

class QuestionWidget extends StatelessWidget {
  QuestionDetail questionanswer;
  QuestionCategory question_category;

  QuestionWidget(
    this.questionanswer,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 3.0,
        bottom: 0.0,
      ),
      child: Expanded(
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          elevation: 1.5,
          child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionDetailPage(questionanswer),
                )),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: Theme.of(context).accentColor),
                    width: 4,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      questionanswer.question,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12.0,
                    color: Colors.grey,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
