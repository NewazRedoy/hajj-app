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
          HomePageItem(Icons.adjust, 'Emergency'),
          HomePageItem(Icons.adjust, 'Remainder'),
          HomePageItem(Icons.adjust, 'Dua'),
          HomePageItem(Icons.adjust, 'Emergency'),
          HomePageItem(Icons.adjust, 'Hajj'),
          HomePageItem(Icons.adjust, 'Hajj'),
        ],
      ),
    );
  }
}

class HomePageItem extends StatelessWidget {
  IconData adjust;
  String s;

  HomePageItem(this.adjust, this.s);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 7.0,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => list(),
          ));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(adjust),
            SizedBox(height: 16,),
            Text(s),
          ],
        ),
      ),
    );
  }
}
