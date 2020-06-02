import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/widgets/QuestionListItem.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class QuestionPage extends StatelessWidget {
  QuestionCategory questionCategory;

  QuestionPage(
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
  QuestionCategory question_category;

  SampleAppPage(this.question_category);

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
    return Scaffold(
        body: loading
            ? _buildCircularProgressIndicator()
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  QuestionDetail question = data[index];
                  return QuestionListItem(question);
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
