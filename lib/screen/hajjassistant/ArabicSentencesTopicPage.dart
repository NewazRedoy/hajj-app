import 'package:first_app/model/ArabicSentencesCategory.dart';
import 'package:first_app/screen/hajjassistant/ArabicSentencesDetailPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:first_app/widgets/Search&Settings.dart';
import 'package:flutter/material.dart';

class ArabicSentencesTopicPage extends StatefulWidget {
  final Subtopic subtopic;
  ArabicSentencesTopicPage(this.subtopic);
  @override
  _ArabicSentencesTopicPageState createState() =>
      _ArabicSentencesTopicPageState();
}

class _ArabicSentencesTopicPageState extends State<ArabicSentencesTopicPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.sentense_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.subtopic.name_en),
          actions: <Widget>[SearchSettings(),],
        ),
        body: loading
            ? _buildCircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  SentencesCategory sentencesCategory = data[index];

                  return ListPageItem(
                      (index + 1), sentencesCategory.sentencetopic, () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArabicSentencesDetailPage(
                                  sentences: sentencesCategory,
                                )));
                  });
                }));
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

