import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/screen/questions/QuestionDetailPage.dart';

class QuestionListItem extends StatelessWidget {
  QuestionDetail questionanswer;

  QuestionListItem(
    this.questionanswer,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 5.0,
        bottom: 5.0,
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
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      questionanswer.question,
                      style: TextStyle(fontSize: 18),
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
