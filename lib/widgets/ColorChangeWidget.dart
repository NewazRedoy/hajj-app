import 'package:flutter/material.dart';

class ColorChangeWidget extends StatelessWidget {

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
                GestureDetector(
                  onTap: () {
                    var color=Colors.deepOrangeAccent;
                  },
                    child: CircleAvatar(
                      backgroundColor:Colors.deepOrangeAccent,
                    ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: CircleAvatar(
                    backgroundColor:Colors.amberAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: CircleAvatar(
                    backgroundColor:Colors.lightBlueAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    var color=Colors.lightGreenAccent;
                  },
                  child: CircleAvatar(
                    backgroundColor:Colors.lightGreen,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: CircleAvatar(
                    backgroundColor:Colors.purpleAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: CircleAvatar(
                    backgroundColor:Colors.black26,
                  ),
                ),
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
