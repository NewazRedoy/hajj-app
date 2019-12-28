import 'package:hajjapp/screen/AppDrawerPage.dart';
import 'package:hajjapp/screen/TopicGridPage.dart';
import 'package:hajjapp/screen/dua/DuaTopicPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: Text("Hajj App"),
        actions: <Widget>[
          SearchSettings()
        ],
        bottom: TabBar(
          controller: controller,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.question_answer),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          TopicGridPage(),
          DuaTopicPage(),
        ],
      ),
    );
  }
}
