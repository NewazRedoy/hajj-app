import 'package:flutter/material.dart';
import 'package:hajjapp/model/MyDua.dart';
import 'package:hajjapp/provider/CurrentUserModel.dart';
import 'package:provider/provider.dart';

class ColorChangeWidget extends StatelessWidget {
  ColorChangeWidget(this.dua);
final MyDua dua;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Container(
        width: 70.0,
        height: 150.0,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ColorItem(Colors.red, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.red);
                }),
                ColorItem(Colors.amberAccent, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.amberAccent);
                }),
                ColorItem(Colors.lightBlueAccent, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.lightBlueAccent);
                }),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ColorItem(Colors.lightGreenAccent, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.lightGreenAccent);
                }),
                ColorItem(Colors.purpleAccent, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.purpleAccent);
                }),
                ColorItem(Colors.black, (){
                  Provider.of<CurrentUserModel>(context, listen: false).updateDuaColor(dua, Colors.black);
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

class ColorItem extends StatelessWidget {
final  Function function;
final Color color;

  ColorItem(this.color,this.function);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
        child: CircleAvatar(
          backgroundColor:color,
        ),
    );
  }
}
