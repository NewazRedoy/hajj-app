import 'package:flutter/material.dart';
import 'package:hajjapp/screen/AppDrawerPage.dart';
import 'package:hajjapp/screen/HomePage.dart';
import 'package:hajjapp/screen/dua/DuaTopicPage.dart';
import 'package:hajjapp/screen/questions/QuestionAnswerPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  Widget callPages(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return DuaTopicPage();
      case 2:
        return QuestionAnswerTopicPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    var appBarName = [
      "হাজ্জ উমরাহ গাইড",
      "দু'আ",
      "প্রশ্নোত্তর",
    ];

    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text(appBarName[_currentIndex]),
        actions: <Widget>[SearchSettings()],
      ),
      body: callPages(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Home-Colored.png",
              height: 20,
              width: 20,
            ),
            title: Text("হোম"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/Dua-Colored.png",
              height: 20,
              width: 20,
            ),
            title: Text("দু'আ"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/QnA-Colored.png',
              height: 20,
              width: 20,
            ),
            title: Text("প্রশ্নোত্তর"),
          ),
        ],
      ),
    );
  }
}
