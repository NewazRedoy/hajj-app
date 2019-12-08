import 'package:first_app/model/Content.dart';
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SubtopicListPage(collection: collection);

                }
              ),
            );
          },
        child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                collection.abbv,
              ),
              Text(
                collection.name,
                style: TextStyle(fontSize: 12),
              ),
            ]),
      ),
    );
  }
}
