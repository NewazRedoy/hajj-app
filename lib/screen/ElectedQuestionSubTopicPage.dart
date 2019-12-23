import 'package:first_app/model/QuestionsSubTopic.dart';
import 'package:first_app/util/Constants.dart';
import 'package:first_app/widgets/ElectedQuestionSubTopicItem.dart';
import 'package:flutter/material.dart';

class ElectedQuestionSubtopicPage extends StatelessWidget {
  QuestionSubtopic catechism;

   ElectedQuestionSubtopicPage(this.catechism,);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           centerTitle: true,
           backgroundColor: Colors.white,
           leading: IconButton(
             icon: Icon(
               Icons.chevron_left,
               size: 40.0,
               color: Colors.black,
             ),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
           title: Text(
             catechism.questiontopic,
             style: TextStyle(
               color: Colors.black,
             ),
           ),
         ),
         body: SampleAppPage(catechism));
   }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage(this.catechism);

  QuestionSubtopic catechism;

  @override
  _SampleAppPageState createState() => _SampleAppPageState(catechism);
}

class _SampleAppPageState extends State<SampleAppPage> {
  QuestionSubtopic catechism;

  _SampleAppPageState(this.catechism);

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
//              setState(() {
//                int newNumberOfDays =
//                    (previousNumOfDays / scaleDetails.scale).round();
//                if (newNumberOfDays >= 7) {
//                  numberOfDays = newNumberOfDays;
//                }
//              });
        },
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: ( context, questionsubtopic) {
              return ElectedQuestionSubTopicListItem(questionsubtopic, data[questionsubtopic]);
            }));
  }

  loadData() async {
    var content = await Constants.catechism;
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





