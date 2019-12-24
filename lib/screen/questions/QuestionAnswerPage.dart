import 'package:first_app/provider/CurrentUserModel.dart';
import 'package:first_app/screen/LoginPage.dart';
import 'package:first_app/screen/questions/ElectedQuestionPage.dart';
import 'package:first_app/screen/questions/SendQuestionPage.dart';
import 'package:flutter/material.dart';
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
      ),
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              Item(Icons.adjust, 'নির্বাচিত প্রশ্নোত্তর', 1),
              Item(Icons.adjust, 'প্রশ্ন করুন', 2),
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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              if (option < 2) {
                return ElectedQuestionPage();
              } else {
                var user = Provider.of<CurrentUserModel>(context).user;
                if (user == null) {
                  return LoginPage();
                } else
                  return SendQuestionPage();
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
    );
  }
}