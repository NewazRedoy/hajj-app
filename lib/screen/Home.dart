import 'package:first_app/screen/TopicGridPage.dart';
import 'package:flutter/material.dart';

import 'chat.dart' as appdrawer;

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

  hexColor(String colorCode) {
    String colorNew = '0xff' + colorCode;
    colorNew = colorNew.replaceAll('#', '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        decoration: BoxDecoration(
          color: Color(hexColor('4F7491')),
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(),
                accountName: Text("write name"),
                accountEmail: Text(""),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Verifiction"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Ratting & Review"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Contact with Us"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Share"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Book Mark"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.album),
                title: Text("Contact"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Hajj App"),
        backgroundColor: Color(hexColor('4F7491')),
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
          appdrawer.AppDrawer(),
        ],
      ),
    );
  }
}
