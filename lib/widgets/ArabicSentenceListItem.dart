import 'package:flutter/material.dart';
import 'package:hajjapp/model/ArabicSentences.dart';

class ArabicSentenceListItem extends StatelessWidget {
  ArabicSentence arabicSentence;

  ArabicSentenceListItem(this.arabicSentence);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 1.5,
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              arabicSentence.bangla,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              arabicSentence.arabic,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Divider(),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              arabicSentence.pronunciation,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
        ]),
      ),
    );
  }
}
