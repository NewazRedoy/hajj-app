import 'package:first_app/model/Topic.dart';
import 'package:first_app/screen/HajjUmrahAssistantPage.dart';
import 'package:first_app/screen/QuestionAnswerPage.dart';
import 'package:first_app/screen/SubTopicListPage.dart';
import 'package:flutter/material.dart';

class TopicGridItem extends StatelessWidget {
  const TopicGridItem({
    Key key,
    @required this.context,
    @required this.topic,
    this.index,
  }) : super(key: key);

  final BuildContext context;
  final Topic topic;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            if (topic.topic_id < 7) {
              return SubtopicListPage(topic: topic);
            } else if (topic.topic_id == 8) {
              return HajjAssistantPage(
                topic: topic,
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
            Icon(Icons.star_border,size: 24,),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                topic.name,
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
