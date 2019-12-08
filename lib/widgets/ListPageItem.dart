import 'package:first_app/screen/SubTopicListPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/QuestionAnwser.dart';

class ListPageItem extends StatelessWidget {
  int index;
  String s;

  ListPageItem(this.index, this.s);

  hexColor(String colorCode) {
    String colorNew = '0xff' + colorCode;
    colorNew = colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  @override
  Widget build(BuildContext context) {
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
                builder: (context) => SubtopicListPage(),
              ));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Color(hexColor('A8926D'))),
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
                s,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Color(hexColor('A8926D'))),
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}