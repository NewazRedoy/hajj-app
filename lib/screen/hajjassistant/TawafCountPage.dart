import 'package:first_app/widgets/Search&Settings.dart';
import 'package:first_app/widgets/TawafWidget.dart';
import 'package:flutter/material.dart';

class TawafCountPage extends StatefulWidget {
  @override
  _TawafCountPageState createState() => _TawafCountPageState();
}

class _TawafCountPageState extends State<TawafCountPage> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("তাওয়াফ গণনা"),
        actions: <Widget>[SearchSettings(),],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                  "প্রতিবার হাজরে আসওয়াদের কাছে পৌঁছে নিচের বাটন ট্যাপ করুন"),
            ),
            SizedBox(
              height: 8,
            ),
            Text("$count/7"),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 200,
              width: 200,
              child: CustomPaint(foregroundPainter: TawafWidget(count / 7)),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              onPressed: () {
                if (count < 7) {
                  setState(() {
                    count++;
                  });
                }
              },
              child: Text("হাজরে আসওয়াদের কাছে পৌঁছেছেন"),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("দু'আ তালিকা"),
            ),
          ],
        ),
      ),
    );
  }
}
