import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/screen/questions/ElectedQuestionSubTopicPage.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

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