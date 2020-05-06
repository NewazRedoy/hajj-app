import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:hajjapp/screen/LoginPage.dart';
import 'package:hajjapp/screen/questions/AskQuestionPage.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:provider/provider.dart';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("প্রশ্নসমূহ"),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Item(Icons.star_border, 'নির্বাচিত প্রশ্নোত্তর', 1),
              Item(Icons.star_border, 'প্রশ্ন করুন', 2),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final int option;

  Item(this.icon, this.title, this.option);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 1.5,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                if (option < 2) {
                  return ElectedQuestionPage();
                } else {
                  var user = Provider.of<CurrentUserProvider>(context).user;
                  if (user == null) {
                    return LoginPage();
                  } else
                    return AskQuestionPage();
                }
              }),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon),
              SizedBox(
                height: 16,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
