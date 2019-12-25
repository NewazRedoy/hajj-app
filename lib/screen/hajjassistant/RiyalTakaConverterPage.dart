import 'package:first_app/widgets/Search&Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiyalConverter extends StatefulWidget {
  @override
  _RiyalConverterState createState() => _RiyalConverterState();
}

class _RiyalConverterState extends State<RiyalConverter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("রিয়াল-টাকা কনভার্টার"),
        actions: <Widget>[SearchSettings(),],
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset("assets/images/BangladeshFlag.png"),
                    Text("টাকা"),
                  ],
                ),
                TextField(
                  maxLines: 3,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            Divider(),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset("assets/images/SaudiarabiaFlag.png"),
                    Text("রিয়াল"),
                  ],
                ),
                TextField(
                  maxLines: 3,
                  keyboardType: TextInputType.number,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

