import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserProvider.dart';
import 'package:provider/provider.dart';

class ColorChangeWidget extends StatelessWidget {
  ColorChangeWidget(this.dua);

  final MyDua dua;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 70.0,
        height: 150.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ColorItem(Colors.red, () {
                  updateDuaColor(context, dua, Colors.red);
                }),
                ColorItem(Colors.amberAccent, () {
                  updateDuaColor(context, dua, Colors.amberAccent);
                }),
                ColorItem(Colors.lightBlueAccent, () {
                  updateDuaColor(context, dua, Colors.lightBlueAccent);
                }),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ColorItem(Colors.lightGreenAccent, () {
                  updateDuaColor(context, dua, Colors.lightGreenAccent);
                }),
                ColorItem(Colors.purpleAccent, () {
                  updateDuaColor(context, dua, Colors.purpleAccent);
                }),
                ColorItem(Colors.grey, () {
                  updateDuaColor(context, dua, Colors.grey);
                }),
              ],
            ),
            SizedBox(height: 10.0),
            FlatButton(
                padding: EdgeInsets.all(0),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {},
                child: Text("বাতিল")),
          ],
        ),
      ),
    );
  }
}

void updateDuaColor(BuildContext context, MyDua dua, ColorSwatch color) {
  Provider.of<CurrentUserProvider>(context, listen: false).updateDuaColor(dua, color);
  Navigator.pop(context);
}

class ColorItem extends StatelessWidget {
  final Function function;
  final Color color;

  ColorItem(this.color, this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: CircleAvatar(
        backgroundColor: color,
      ),
    );
  }
}
