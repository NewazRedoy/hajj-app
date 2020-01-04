import 'package:flutter/material.dart';
import 'package:hajjapp/model/Subtopic.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/SieWidget.dart';

class SaiCount extends StatefulWidget {
  final Subtopic subtopic;

  SaiCount(this.subtopic);

  @override
  _SaiCountState createState() => _SaiCountState();
}

class _SaiCountState extends State<SaiCount> {
  bool started = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subtopic.name_en),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
                "সাফা থেকে শুরু করুন এবং মারওয়ায় পৌঁছে সাফা এবং মারওয়াতে ট্যাপ করুন"),
            RaisedButton(
                onPressed: () {
                  if (count < 7) {
                    setState(() {
                      count++;
                    });
                  }
                },
                child: Text("মারওয়া")),
            Row(children: <Widget>[
              Text("$count/7"),
              Expanded(
                child: Container(
                    height: 400,
                    width: 200,
                    child: CustomPaint(
                      foregroundPainter: SieWidget(count / 7),
                    )),
              ),
            ]),
            RaisedButton(
                onPressed: () {
                  if (count < 7) {
                    setState(() {
                      count++;
                    });
                  }
                },
                child: Text("সাফা")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                    shape: StadiumBorder(),
                    onPressed: () {},
                    child: Text("দু'আ তালিকা")),
                RaisedButton.icon(
                  color: Colors.red,
                  shape: StadiumBorder(),
                  onPressed: () {},
                  icon: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      )),
                  label: Text(
                    "শুরু করুন",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
