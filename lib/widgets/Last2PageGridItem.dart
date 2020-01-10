import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/screen/hajjassistant/ArabicSentencesTopicPage.dart';
import 'package:hajjapp/screen/hajjassistant/RiyalTakaConverterPage.dart';
import 'package:hajjapp/screen/hajjassistant/SieCountPage.dart';
import 'package:hajjapp/screen/hajjassistant/TawafCountPage.dart';
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
            },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              Icon(Icons.star_border),
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
