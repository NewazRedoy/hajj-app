import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/SubTopicListPage.dart';
import 'package:hajjapp/screen/hajjassistant/ArabicSentencesTopicPage.dart';
import 'package:hajjapp/screen/hajjassistant/RiyalTakaConverterPage.dart';
import 'package:hajjapp/screen/hajjassistant/SieCountPage.dart';
import 'package:hajjapp/screen/hajjassistant/TawafCountPage.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/TopicGridItem.dart';

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
      body: loading
          ? _buildCircularProgressIndicator()
          : Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TopicGridItem(topic: data[2]),
                      TopicGridItem(topic: data[3]),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Topic topic = data[index];
                      return ListPageItem(
                        (index + 1),
                        topic.name,
                        () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            if (topic.topic_id < 7) {
                              return SubtopicListPage(topic: topic);
                            } else if (topic.topic_id == 8) {
                              return TawafCountPage(topic);
                            } else if (topic.topic_id == 9) {
                              return SaiCount(topic);
                            } else if (topic.topic_id == 10) {
                              return RiyalConverter(topic);
                            } else if (topic.topic_id == 11) {
                              return ArabicSentencesTopicPage(topic);
                            } else {
                              return ElectedQuestionPage();
                            }
                          }));
                        },
                      );
                    },
                  ),
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
