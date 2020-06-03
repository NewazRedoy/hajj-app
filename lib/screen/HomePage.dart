import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/screen/content/SubTopicListPage.dart';
import 'package:hajjapp/screen/hajjassistant/ArabicSentencesTopicPage.dart';
import 'package:hajjapp/screen/hajjassistant/RiyalTakaConverterPage.dart';
import 'package:hajjapp/screen/hajjassistant/SieCountPage.dart';
import 'package:hajjapp/screen/hajjassistant/TawafCountPage.dart';
import 'package:hajjapp/screen/questions/QuestionAnswerPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/TopicGridItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = Constants.topics;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    DataProvider.of(context).dbLoading; //preload database
    return Scaffold(
      body: loading
          ? _buildCircularProgressIndicator()
          : Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: TopicGridItem(
                                topic: Topic(topic_id: 3, name: 'ধাপে ধাপে উমরাহ', color: '#4859b5'),
                                image: "assets/images/Umrah-Kaba.png")),
                        Expanded(
                            child: TopicGridItem(
                                topic: Topic(topic_id: 4, name: 'ধাপে ধাপে হজ্জ', color: '#5677fc'),
                                image: "assets/images/Hajj-Arafah.png")),
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
                                return TawafCountPage(
                                  topic,
                                );
                              } else if (topic.topic_id == 9) {
                                return SaiCount(topic);
                              } else if (topic.topic_id == 10) {
                                return RiyalConverter(topic);
                              } else if (topic.topic_id == 11) {
                                return ArabicSentencesTopicPage(topic);
                              } else {
                                return QuestionAnswerTopicPage();
                              }
                            }));
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
          ),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
