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
      "আমার হাজ্জ",
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset(
                    "assets/images/Home-Colored.png",
                    height: 22,
                    width: 22,
                  )
                : Image.asset(
                    "assets/images/Home-Greyed.png",
                    height: 22,
                    width: 22,
                  ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset(
                    "assets/images/Dua-Colored.png",
                    height: 25,
                    width: 25,
                  )
                : Image.asset(
                    "assets/images/Dua-Greyed.png",
                    height: 25,
                    width: 25,
                  ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset(
                    'assets/images/QnA-Colored.png',
                    height: 24,
                    width: 24,
                  )
                : Image.asset(
                    'assets/images/QnA-Greyed.png',
                    height: 24,
                    width: 24,
                  ),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
