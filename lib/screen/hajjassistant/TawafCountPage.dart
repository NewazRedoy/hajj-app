import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/TawafWidget.dart';

class TawafCountPage extends StatefulWidget {
  final Topic topic;

  TawafCountPage(
    this.topic,
  );

  @override
  _TawafCountPageState createState() => _TawafCountPageState();
}

class _TawafCountPageState extends State<TawafCountPage> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  Animation<double> animation;
  int count = 0;
  AnimationController controller;
  bool start = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });

    if (count > 0) {
      controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (count > 0 && count <= 7 && !controller.isAnimating)
      controller.repeat();
    else if ((count == 0 || count == 7) && controller.isAnimating) controller.stop();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.name),
        actions: <Widget>[
          SearchSettings(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Text("প্রতিবার হাজরে আসওয়াদের কাছে পৌঁছে নিচের বাটন ট্যাপ করুন"),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "$count/7",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
//            SizedBox(
//              height: 4,
//            ),
            Container(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(foregroundPainter: TawafWidget(count, _fraction, context)),
            ),
            Container(
                padding: EdgeInsets.only(left: 40.0, right: 50.0),
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/Dua-Colored.png",
                  height: 20,
                  width: 20,
                )),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                if (count < 7) {
                  setState(() {
                    count++;
                  });
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialogTawaf();
                      });
                }
              },
              child: Text("হাজরে আসওয়াদের কাছে পৌঁছেছেন"),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  padding: EdgeInsets.all(5),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DuaDetailPage(DuaCategory(id: 5, name: "adas")),
                        ));
                  },
                  child: Padding(padding: EdgeInsets.all(5), child: Text("দু'আ তালিকা")),
                ),
                count == 0
                    ? RaisedButton(
                        padding: EdgeInsets.all(2),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: Colors.red,
                        shape: StadiumBorder(),
                        onPressed: () {
                          setState(() {
                            count++;
                            start = true;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.red,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "শুরু করুন",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      )
                    : RaisedButton(
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(2),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: StadiumBorder(),
                        onPressed: () {
                          setState(() {
                            count = 0;
                            start = false;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.redo,
                                  color: Theme.of(context).primaryColor,
                                )),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "রিসেট করুন",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<ui.Image> loadImage(List<int> img) async {
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(img, (ui.Image img) {
      setState(() {});
      return completer.complete(img);
    });
    return completer.future;
  }

  @override
  void dispose() {
    this.controller.dispose();
    super.dispose();
  }
}

class AlertDialogTawaf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: IconButton(
                icon: Icon(
                  Icons.highlight_off,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => Navigator.pop(context)),
          ),
          Icon(
            Icons.check_circle_outline,
            color: Theme.of(context).accentColor,
            size: 50.0,
          ),
          SizedBox(
            height: 2.0,
          ),
          Text("আলহামদুল্লিহ!"),
          Text(" আপনার তাওয়াফ সম্পন্ন হয়েছে ।"),
        ],
      ),
    );
  }
}
