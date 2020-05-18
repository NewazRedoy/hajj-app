import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/screen/content/ContentDetailListPage.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class SubtopicListPage extends StatelessWidget {
  final Topic topic;

  SubtopicListPage({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            topic.name,
          ),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: SampleAppPage(topic));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.topic);

  final Topic topic;

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List data = [];
  var loading = true;

  _SampleAppPageState();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? _buildCircularProgressIndicator()
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int position) {
              var subtopic = data[position];

              return ListPageItem((position + 1), subtopic.name, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContentDetailListPage(subtopic),
                    ));
              });
            });
  }

  loadData() async {
    var subtopics = await DataProvider.of(context).querySubtopicsByTopicId(widget.topic.topic_id);

    setState(() {
      data = subtopics;
      loading = false;
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
