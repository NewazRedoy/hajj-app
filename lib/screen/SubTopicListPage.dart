import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/model/Topic.dart';
import 'package:first_app/model/database_helper.dart';
import 'package:first_app/screen/ContentDetailListPage.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class SubtopicListPage extends StatelessWidget {
  final Topic topic;

  SubtopicListPage({this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            topic.name,
          ),
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
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int position) {
              var subtopic = Subtopic.fromJson(data[position]);

              return ListPageItem((position + 1), subtopic.name_en, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContentDetailListPage(subtopic),
                    ));
              });
            });
  }

  loadData() async {
    var books =
        await DatabaseHelper.instance.queryBooksByTopicId(topic.topic_id);

    setState(() {
      data = books;
      loading = false;
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
