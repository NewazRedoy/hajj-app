import 'package:first_app/model/Topic.dart';
import 'package:first_app/widgets/ContentPageItem.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class ContentDetailListPage extends StatefulWidget {
  final Topic collection;

  ContentDetailListPage({this.collection});

  @override
  _ContentDetailListPageState createState() => _ContentDetailListPageState();
}

class _ContentDetailListPageState extends State<ContentDetailListPage> {
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
            return ContentPageItem(index, 'text');
          },
        ));
  }
}
