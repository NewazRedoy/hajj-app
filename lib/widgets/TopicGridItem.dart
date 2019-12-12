import 'package:first_app/model/Topic.dart';
import 'package:first_app/screen/QuestionAnswer.dart';
import 'package:first_app/screen/SubTopicListPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screen/HajjUmrahAssistant.dart';
class CollectionItem extends StatelessWidget {
  const CollectionItem({
    Key key,
    @required this.context,
    @required this.collection,
    this.index,
  }) : super(key: key);

  final BuildContext context;
  final Topic collection;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 7.0,
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                if (collection.id < 7) {
                  return SubtopicListPage(topic: collection);
                } else if (collection.id ==8) {
                  return HajjAssistant();}
                else {
                  return QueAns();
                }
              }));
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                collection.abbv,
              ),
              Text(
                collection.name,
                style: TextStyle(fontSize: 12),
              ),
            ])));
  }
}
