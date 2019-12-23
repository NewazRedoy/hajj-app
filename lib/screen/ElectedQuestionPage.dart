import 'package:first_app/model/QuestionsCategory.dart';
import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/screen/ElectedQuestionSubTopicPage.dart';
import 'package:first_app/util/Constants.dart';
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
                return NewWidget(index, data[index]);
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

class NewWidget extends StatelessWidget {
  int index;
  QuestionCategory questionCategory;

  NewWidget(this.index, this.questionCategory);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 7.0,
        child: InkWell(
          onTap: () {
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    index.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    questionCategory.questiontopic,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ]),
        ));
  }
}
