import 'package:first_app/list.dart';
import 'package:flutter/material.dart';

class GridVe extends StatefulWidget {
  @override
  _GridVeState createState() => _GridVeState();
}

class _GridVeState extends State<GridVe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
      children: <Widget>[
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 7.0,
              child: Column(
                children: <Widget>[
                  Icon(Icons.adjust),
                  Text("Hajj"),
                ],
              ),

            ),
          ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: InkWell(
              child: Text("Remainder"),
              onTap:() {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> list(),
                ));
              },
            ),

          ),

        ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Dua"),
              ],
            ),

          ),
        ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Emergency"),
              ],
            ),

          ),
        ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Hajj"),
              ],
            ),

          ),
        ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Hajj"),
              ],
            ),

          ),
        ),
        Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Hajj"),
              ],
            ),

          ),
        ),
        Container(

          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 7.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.adjust),
                Text("Hajj"),
              ],
            ),

          ),
        ),
      ],
      ),
    );
  }
}
