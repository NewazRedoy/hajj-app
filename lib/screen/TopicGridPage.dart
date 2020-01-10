import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/SubTopicListPage.dart';
import 'package:hajjapp/screen/hajjassistant/ArabicSentencesTopicPage.dart';
import 'package:hajjapp/screen/hajjassistant/HajjUmrahAssistantPage.dart';
import 'package:hajjapp/screen/hajjassistant/RiyalTakaConverterPage.dart';
import 'package:hajjapp/screen/hajjassistant/SieCountPage.dart';
import 'package:hajjapp/screen/hajjassistant/TawafCountPage.dart';
import 'package:hajjapp/screen/questions/QuestionAnswerPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';

class TopicGridPage extends StatefulWidget {
  @override
  _TopicGridPageState createState() => _TopicGridPageState();
}

class _TopicGridPageState extends State<TopicGridPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.topics;
    setState(() {
      data = content;
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              Container(),
            ],
          ),
          loading
              ? _buildCircularProgressIndicator()
         : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Topic topic= data[index];
              return ListPageItem((index + 1), topic.name, () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  if (topic.topic_id < 7) {
                    return SubtopicListPage(topic: topic);
                  } else if (topic.topic_id == 8) {
                    return HajjAssistantPage(
                      topic: topic,
                    );
                  }
                  else if (topic.topic_id == 9) {
                    return TawafCountPage(topic);
                  }
                  else if (topic.topic_id == 10) {
                    return SaiCount(topic);
                  }
                  else if (topic.topic_id == 11) {
                    return RiyalConverter(topic);
                  }
                  else if (topic.topic_id ==12) {
                    return ArabicSentencesTopicPage(topic);
                  }
                  else {
                    return QuestionAnswerPage();
                  }
                }));
              },
              );},
          )
        ],
      ),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}