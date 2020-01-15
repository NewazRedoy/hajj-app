import 'package:flutter/material.dart';

class ColorChangeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content:Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    color: Colors.amberAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
