import 'package:flutter/material.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/screen/ElectedQuestionSubTopicPage.dart';

class ElectedQuestionListItem extends StatelessWidget {
int index;
QuestionCategory questionCategory;
QuestionSubtopic questionsubtopic;

  ElectedQuestionListItem(this.index,this.questionsubtopic,this.questionCategory);
hexColor(String colorCode) {
  String colorNew = '0xff' + colorCode;
  colorNew = colorNew.replaceAll('#', '');
  int colorInt = int.parse(colorNew);
  return colorInt;
}
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
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
                builder: (context) => ElectedQuestionSubtopicPage(questionsubtopic),
              ));
        },
        child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Color(hexColor('A8926D'))),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    questionCategory.category_id.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    questionCategory.questiontopic,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(hexColor('A8926D'))),
                  padding: const EdgeInsets.fromLTRB(5 , 24 , 5,24),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),

      ),
    ),
  );
}
}
