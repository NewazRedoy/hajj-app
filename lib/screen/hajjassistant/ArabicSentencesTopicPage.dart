import 'package:flutter/material.dart';
import 'package:hajjapp/model/ArabicSentencesCategory.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/hajjassistant/ArabicSentencesDetailPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class ArabicSentencesTopicPage extends StatefulWidget {
  final Topic topic;
  ArabicSentencesTopicPage(this.topic);
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
          title: Text(widget.topic.name),
          actions: <Widget>[
            SearchSettings(),
          ],
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
