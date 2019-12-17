import 'package:first_app/screen/AppDrawerPage.dart';
import 'package:first_app/screen/TopicGridPage.dart';
import 'package:flutter/material.dart';

import 'DuaPage.dart' as DuaPage;

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
      drawer: AppDrawerPage(),
      appBar: AppBar(
        title: Text("Hajj App"),
        bottom: TabBar(
          controller: controller,
          indicatorWeight: 5.0,
          indicatorColor: Colors.lime,
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
          DuaPage.DuaPage(),
        ],
      ),
    );
  }
}
