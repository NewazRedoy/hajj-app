import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/SubTopicListPage.dart';

class TopicGridItem extends StatelessWidget {
  const TopicGridItem({
    Key key,
    @required this.context,
    @required this.topic,
    this.index, this.image,
  }) : super(key: key);

  final BuildContext context;
  final Topic topic;
  final index;
final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 1.5,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SubtopicListPage(topic: topic);
          }));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 16,
            ),
            Image.asset(image,width: 44, height: 44,),
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
