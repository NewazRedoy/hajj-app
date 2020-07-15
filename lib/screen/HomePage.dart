import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/questions/QuestionAnswerPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/GridItem.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';

import 'content/SubTopicListPage.dart';
import 'hajjassistant/ArabicSentencesTopicPage.dart';
import 'hajjassistant/RiyalTakaConverterPage.dart';
import 'hajjassistant/SieCountPage.dart';
import 'hajjassistant/TawafCountPage.dart';

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
    return Scaffold(
        body: loading
            ? _buildCircularProgressIndicator()
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GridItem(
                            topic: Topic(topic_id: 3, name: 'ধাপে ধাপে উমরাহ', color: '#4859b5'),
                            image: "assets/images/Umrah-Kaba.png"),
                        GridItem(
                            topic: Topic(topic_id: 4, name: 'ধাপে ধাপে হজ্জ', color: '#5677fc'),
                            image: "assets/images/Hajj-Arafah.png"),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
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
                      childCount: data.length
                    ),
                  ),
                ],
              ));
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
