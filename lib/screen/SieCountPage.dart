import 'package:first_app/widgets/CircleProgress.dart';
import 'package:flutter/material.dart';

class SaiCount extends StatefulWidget {
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
        title: Text("স'ঈ গণনা"),
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
              Container(
                  height: 400,
                  width: 200,
                  child: CustomPaint(
                    foregroundPainter: CircleProgress(count / 7),
                  )),
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
                RaisedButton(shape: StadiumBorder(),onPressed: () {}, child: Text("দু'আ তালিকা")),
                    RaisedButton(color: Colors.red, shape: StadiumBorder(),
                      onPressed: () {},
                      child:
                      Row(children: <Widget>[
                          CircleAvatar(backgroundColor:Colors.white,
                              child: Icon(Icons.arrow_upward,color: Colors.red,)),
                          SizedBox(width:5.0),
                          Text("শুরু করুন",
                          style: TextStyle(color: Colors.white) ,
                          ),],),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
