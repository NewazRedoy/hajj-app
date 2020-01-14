import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/SubTopicListPage.dart';
import 'package:hajjapp/screen/hajjassistant/HajjUmrahAssistantPage.dart';
import 'package:hajjapp/screen/questions/QuestionAnswerPage.dart';

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
            Icon(
              Icons.star_border,
              size: 24,
            ),
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
