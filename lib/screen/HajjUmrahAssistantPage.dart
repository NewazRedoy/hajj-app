import 'package:first_app/screen/RiyalTakaConverterPage.dart';
import 'package:first_app/screen/SieCountPage.dart';
import 'package:first_app/screen/SomeArabicSentencesPage.dart';
import 'package:first_app/screen/TawafCountPage.dart';
import 'package:flutter/material.dart';
import 'package:first_app/model/Subtopic.dart';
import 'package:first_app/model/Topic.dart';
import 'package:first_app/model/database_helper.dart';
import 'package:first_app/widgets/Last2PageGridItem.dart';

class HajjAssistantPage extends StatelessWidget {
  final Topic topic;

  HajjAssistantPage({this.topic});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.black,
            )),
        title: Text( topic.name,
          style: TextStyle(
            color: Colors.black,
          ),),
      ),
      body:SampleAppPage(topic));
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
        : GridView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int position) {
          return new Last2PageGridItem(
              position, Subtopic.fromJson(data[position]));
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

