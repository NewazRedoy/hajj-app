import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/content/SubTopicListPage.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    Key key,
    @required this.context,
    @required this.topic,
    this.index,
    this.image,
  }) : super(key: key);

  final BuildContext context;
  final Topic topic;
  final index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      width: 170.0,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        elevation: 3,
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
              Image.asset(
                image,
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  topic.name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
