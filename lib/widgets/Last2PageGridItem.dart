import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/screen/hajjassistant/ArabicSentencesTopicPage.dart';
import 'package:first_app/screen/hajjassistant/RiyalTakaConverterPage.dart';
import 'package:first_app/screen/hajjassistant/SieCountPage.dart';
import 'package:first_app/screen/hajjassistant/TawafCountPage.dart';
import 'package:flutter/material.dart';

class Last2PageGridItem extends StatelessWidget {
  int index;
  Subtopic subtopic;

  Last2PageGridItem(
    this.index,
    this.subtopic,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 7.0,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              switch (subtopic.subtopic_id) {
                case 1:
                  return TawafCountPage();
                case 2:
                  return SaiCount();
                case 3:
                  return RiyalConverter();
                case 4:
                  return ArabicSentencesTopicPage();
              }
            }));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Icon(Icons.adjust),
              Text(
                subtopic.name_en,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
