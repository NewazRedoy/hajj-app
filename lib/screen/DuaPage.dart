import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.blueGrey, width: 2.0)),
              ),
              child: ListTile(
                title: Text("Text"),
              ),
            );
          }),
    );
  }
}
