import 'package:flutter/material.dart';

class list extends StatefulWidget {
  @override
  _listState createState() => _listState();
}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hajj App-guide"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text
                ("1"),
            ],
          ),






          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text1")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            color: Colors.teal,
            height: 45.0,
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text2")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text3")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text4")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text5")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text6")),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 45.0,
            child: Material(
              color: Colors.white,
              elevation: 12.0,
              borderRadius: BorderRadius.circular(20.0),
              child: InkWell(
                child: Center(child: Text("Text7")),
                onTap: () {},
              ),
            ),
          ),
        ],

      ),
    );
  }
}
