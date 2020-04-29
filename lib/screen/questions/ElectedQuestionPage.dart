import 'package:flutter/material.dart';
import 'package:hajjapp/model/QuestionsCategory.dart';
import 'package:hajjapp/provider/DataProvider.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionDetailPage.dart';
import 'package:hajjapp/widgets/ListPageItem.dart';

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
                QuestionCategory question = QuestionCategory.fromJson(data[index]);

                return ListPageItem((index + 1), question.name, () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionDetailPage(question),
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
