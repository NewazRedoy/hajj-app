import 'package:flutter/material.dart';
import 'package:hajjapp/screen/AppDrawerPage.dart';
import 'package:hajjapp/screen/TopicGridPage.dart';
import 'package:hajjapp/screen/dua/DuaTopicPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
 int _currentIndex=0;
 Widget callPages(int currentIndex){
  switch (currentIndex){
    case 0: return TopicGridPage();
    case 1: return DuaTopicPage();
  }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text("Hajj App"),
        actions: <Widget>[SearchSettings()],
      ),
      body: callPages(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex=value;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text("DuaTopic"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text("AskQuestion"),
          ),
        ],
      ),
    );
  }
}
