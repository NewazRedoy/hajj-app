import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/util/Constants.dart';
import 'package:flutter/material.dart';

class ElectedQuestionSubtopic extends StatefulWidget {
  final QuestionCategory catechism;

  const ElectedQuestionSubtopic({Key key, @required this.catechism})
      : super(key: key);

  @override
  _ElectedQuestionSubtopicState createState() =>
      _ElectedQuestionSubtopicState(catechism);
}

class _ElectedQuestionSubtopicState extends State<ElectedQuestionSubtopic> {
  QuestionCategory catechism;

  _ElectedQuestionSubtopicState(this.catechism);
  List data = [];
  var loading = true;

  @override
  void initState() {
    super.initState();

    loadData();
  }

  loadData() async {
    var content = await Constants.catechism;
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
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return NewWidget(data[index]);
        },
      ),
    );
  }
}

class NewWidget extends StatelessWidget {

  QuestionSubtopic questionSubtopic;

  NewWidget(this.questionSubtopic);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5.0,
      child: Column(children: <Widget>[
        Container(
          height: 50.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            questionSubtopic.questiontopic,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        Container(
          height: 100.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            questionSubtopic.answer,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ]),
    );
  }
}
