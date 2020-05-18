import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';

import 'QuestionPage.dart';

class QuestionAnswerTopicPage extends StatefulWidget {
  @override
  _QuestionAnswerTopicPageState createState() => _QuestionAnswerTopicPageState();
}

class _QuestionAnswerTopicPageState extends State<QuestionAnswerTopicPage> {
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await DataProvider.of(context).queryQuestionCategories();

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
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                QuestionCategory question = data[index];
                return ListPageItem((index + 1), question.name, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionPage(question),
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
