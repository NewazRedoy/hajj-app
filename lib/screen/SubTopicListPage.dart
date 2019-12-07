import 'package:first_app/model/Topic.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class SubtopicListPage extends StatefulWidget {
  final Topic collection;

  SubtopicListPage({this.collection});

  @override
  _SubtopicListPageState createState() => _SubtopicListPageState();
}

class _SubtopicListPageState extends State<SubtopicListPage> {
  hexColor(String colorCode) {
    String colorNew = '0xff' + colorCode;
    colorNew = colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hajj App-guide"),
          backgroundColor: Color(hexColor('4F7491')),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListPageItem(index, 'text');
          },
        ));
  }
}