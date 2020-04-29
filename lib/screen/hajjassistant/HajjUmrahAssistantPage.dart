import 'package:flutter/material.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/Last2PageGridItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class HajjAssistantPage extends StatelessWidget {
  final Topic topic;

  HajjAssistantPage({this.topic});

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
  _SampleAppPageState createState() => _SampleAppPageState(topic);
}

class _SampleAppPageState extends State<SampleAppPage> {
  List data = [];
  var loading = true;

  _SampleAppPageState(this.topic);

  final Topic topic;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? _buildCircularProgressIndicator()
        : Center(
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int position) {
                  return new Last2PageGridItem(position, data[position]);
                }));
  }

  loadData() async {
    var subtopics = await DataProvider.of(context).querySubtopicsByTopicId(topic.topic_id);

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
