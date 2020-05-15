import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/QuestionAnswerDetailItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class QuestionDetailPage extends StatelessWidget {
  QuestionCategory questionCategory;

  QuestionDetailPage(
    this.questionCategory,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            questionCategory.name,
          ),
          actions: <Widget>[
            SearchSettings(),
          ],
        ),
        body: SampleAppPage(questionCategory));
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.question_category);

  QuestionCategory question_category;

  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  _SampleAppPageState();

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
            onScaleUpdate: (ScaleUpdateDetails scaleDetails) {},
            child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var question = data[index];

                  return QuestionAnswerDetailItem(question);
                }));
  }

  loadData() async {
    var content = await DataProvider.of(context).queryQuestionsByCategoryId(widget.question_category.id);
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
