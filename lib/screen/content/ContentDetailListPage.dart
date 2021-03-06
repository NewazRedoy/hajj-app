import 'package:flutter/material.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ContentListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class ContentDetailListPage extends StatelessWidget {

  Subtopic subtopic;

  ContentDetailListPage(this.subtopic);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              Constants.topics.firstWhere((element) => element.topic_id ==subtopic.topic_id).name
          ),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: SampleAppPage(subtopic));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.subtopic);

  Subtopic subtopic;

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
        :
        ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int position) {
              return ContentListItem(subtopic: widget.subtopic, content: data[position]);
            });
  }

  loadData() async {
    var content =
        await DataProvider.of(context).queryHadithsBySubtopicId(widget.subtopic.topic_id, widget.subtopic.subtopic_id);

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
