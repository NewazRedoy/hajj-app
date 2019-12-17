import 'package:flutter/material.dart';

class AppDrawerPage extends StatefulWidget {
  @override
  _AppDrawerPageState createState() => _AppDrawerPageState();
}

class _AppDrawerPageState extends State<AppDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              accountName: Text("User Abdullah"),
              accountEmail: Text("Macca,Saudi Arabia"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("নোটিফিকেশন "),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("সেটিংস"),
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("রেটিং এবং রিভিউ"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("আমাদের সম্পর্কে"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("শেয়ার করুন"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text(" বুকমার্ক"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.album),
              title: Text("যোগাযোগ"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
