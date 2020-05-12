import 'package:flutter/material.dart';
import 'package:hajjapp/screen/AppDrawerPage.dart';
import 'package:hajjapp/screen/TopicGridPage.dart';
import 'package:hajjapp/screen/dua/DuaTopicPage.dart';
import 'package:hajjapp/screen/questions/ElectedQuestionPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  Widget callPages(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return DuaTopicPage();
      case 2:
        return ElectedQuestionPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: DrawerPage(),
//      appBar: AppBar(
//        title: Text("হাজ্জ উমরাহ গাইড"),
//        actions: <Widget>[SearchSettings()],
//      ),
      body: callPages(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          _currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/Home-Colored.png",height: 20,width: 20,),
            title: Text("হোম"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/Dua-Colored.png", height: 20,width: 20,),
            title: Text("দু'আ"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/QnA-Colored.png', height: 20,width: 20,),
            title: Text("প্রশ্নোত্তর"),
          ),
        ],
      ),
    );
  }
}
