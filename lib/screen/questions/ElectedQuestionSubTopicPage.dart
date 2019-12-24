import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/model/QuestionDetail.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ElectedQuestionSubTopicItem.dart';
import 'package:first_app/widgets/ListPageItem.dart';
import 'package:flutter/material.dart';

class ElectedQuestionSubtopicPage extends StatelessWidget {
  QuestionCategory questionCategory;

  ElectedQuestionSubtopicPage(
    this.questionCategory,
  );

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
            questionCategory.questiontopic,
          ),
        ),
        body: SampleAppPage(questionCategory));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.question_category);

  QuestionCategory question_category;

  @override
  _SampleAppPageState createState() => _SampleAppPageState(question_category);
}

class _SampleAppPageState extends State<SampleAppPage> {
  QuestionCategory question_category;

  _SampleAppPageState(this.question_category);

  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? _buildCircularProgressIndicator()
        : new GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
            },
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var question = data[index];

                  return ElectedQuestionSubTopicListItem(question);
                }));
  }

  loadData() async {
    var content = await Constants.question_subtopics;
    setState(() {
      data = content;
      loading = false;
    });
  }
}

_buildCircularProgressIndicator() {
  return Center(
    child: CircularProgressIndicator(),
  );
}