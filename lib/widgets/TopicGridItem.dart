import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/model/Topic.dart';
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
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SubtopicListPage(collection: collection);

              }
            ),
          );
        },
        child: Center(
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

