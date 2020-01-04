import 'package:flutter/material.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/TopicGridItem.dart';

class TopicGridPage extends StatefulWidget {
  @override
  _TopicGridPageState createState() => _TopicGridPageState();
}

class _TopicGridPageState extends State<TopicGridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          8,
          (index) {
            return TopicGridItem(
                context: context, topic: Constants.topics[index], index: index);
          },
        ),
      ),
    );
  }
}
