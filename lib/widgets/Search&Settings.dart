import 'package:flutter/material.dart';
import 'package:hajjapp/screen/SearchPage.dart';

class SearchSettings extends StatefulWidget {
  @override
  _SearchSettingsState createState() => _SearchSettingsState();
}

class _SearchSettingsState extends State<SearchSettings> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            size: 24.0,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ),
            );
          },
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(child: Text("সেটিংস")),
            ];
          },
        ),
      ],
    );
  }
}
