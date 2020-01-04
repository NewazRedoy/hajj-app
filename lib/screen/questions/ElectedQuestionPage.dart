import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionSubTopicPage.dart';
import 'package:hajjapp/util/Constants.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class ElectedQuestionPage extends StatefulWidget {
  @override
  _ElectedQuestionPageState createState() => _ElectedQuestionPageState();
}

class _ElectedQuestionPageState extends State<ElectedQuestionPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.question_categories;
    setState(() {
      data = content;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("নির্বাচিত প্রশ্নোত্তর"),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: loading
          ? _buildCircularProgressIndicator()
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                QuestionCategory question = data[index];

                return ListPageItem((index + 1), question.questiontopic, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ElectedQuestionSubtopicPage(question),
                      ));
                });
              },
            ),
    );
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
