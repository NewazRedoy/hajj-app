import 'package:first_app/listview.dart';
import 'package:flutter/material.dart';
import 'package:first_app/listview.dart' as ListView1;
class StateLess View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
      RaisedButton( onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ListView1()),);
      },
        child: Container(
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
      ),
      ],
    ),
    );
  }
}
