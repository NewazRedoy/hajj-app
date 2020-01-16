import 'package:flutter/material.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CurrentUserModel>(context).user;
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            user == null
                ? UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(),
                    accountName: Text("Not Logged In"),
                    accountEmail: Text(""),
                  )
                : UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(),
                    accountName: Text(user.firstName ?? ""),
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
