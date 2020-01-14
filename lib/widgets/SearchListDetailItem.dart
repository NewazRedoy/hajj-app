import 'package:flutter/material.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';

class SearchListDetailItem extends StatelessWidget {
  const SearchListDetailItem({
    Key key,
    @required this.sentencesCategory,
  }) : super(key: key);

  final SentencesCategory sentencesCategory;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              sentencesCategory.name,
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            Text(
              sentencesCategory.name,
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ),
      ),
    );
  }
}
