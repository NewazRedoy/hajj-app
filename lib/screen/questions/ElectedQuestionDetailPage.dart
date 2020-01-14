import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionDetail.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/provider/database_helper.dart';
import 'package:hajjapp/widgets/ElectedQuestionSubTopicItem.dart';
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
                  var question = QuestionDetail.fromJson(data[index]);

                  return ElectedQuestionSubTopicListItem(question);
                }));
  }

  loadData() async {
    var content = await DatabaseHelper.instance.queryQuestionsByCategoryId(widget.question_category.id);
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
