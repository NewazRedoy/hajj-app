import 'package:first_app/model/Content.dart';
import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/model/database_helper.dart';
import 'package:first_app/widgets/ContentListItem.dart';
import 'package:flutter/material.dart';

class ContentDetailListPage extends StatelessWidget {
  Subtopic book;

  ContentDetailListPage(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            book.name_en,)
        ),
        body: SampleAppPage(book));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.book);

  Subtopic book;

  @override
  _SampleAppPageState createState() => _SampleAppPageState(book);
}

class _SampleAppPageState extends State<SampleAppPage> {
  List data = [];
  var loading = true;
  Subtopic book;

  _SampleAppPageState(this.book);

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? _buildCircularProgressIndicator()
        : new GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
//              setState(() {
//                int newNumberOfDays =
//                    (previousNumOfDays / scaleDetails.scale).round();
//                if (newNumberOfDays >= 7) {
//                  numberOfDays = newNumberOfDays;
//                }
//              });
            },
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int position) {
                  return ContentListItem(
                      book: book, content: Content.fromMap(data[position]));
                }));
  }

  loadData() async {
    var content = await DatabaseHelper.instance
        .queryHadithsBySubtopicId(book.topic_id, book.subtopic_id);

    setState(() {
      data = content;
      loading = false;
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
