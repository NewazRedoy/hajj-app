import 'package:first_app/model/Topic.dart';
import 'package:first_app/screen/HajjUmrahAssistantPage.dart';
import 'package:first_app/screen/QuestionAnswerPage.dart';
import 'package:first_app/screen/SubTopicListPage.dart';
import 'package:flutter/material.dart';

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
            if (collection.topic_id < 7) {
              return SubtopicListPage(topic: collection);
            } else if (collection.topic_id == 8) {
              return HajjAssistantPage(
                topic: collection,
              );
            } else {
              return QuestionAnswerPage();
            }
          }));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.adjust),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                collection.name,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
