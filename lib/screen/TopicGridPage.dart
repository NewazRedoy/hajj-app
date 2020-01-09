import 'package:flutter/material.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/hajjassistant/HajjUmrahAssistantPage.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionSubTopicPage.dart';
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
      body: Column(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              2,
              (index) {
                return TopicGridItem(
                    context: context, topic: Constants.topics[index], index: index);
              },
            ),
          ),
          ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              Topic topic= data[index];
              return ListPageItem((index + 1), topic.name, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HajjAssistantPage(
                            topic: topic,
                          ),
                    ));
              },
              );},
          )
        ],
      ),
    );
  }
}
