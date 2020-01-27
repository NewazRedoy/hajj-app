import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/SieWidget.dart';

class SaiCount extends StatefulWidget {
  final Topic topic;

  SaiCount(this.topic);

  @override
  _SaiCountState createState() => _SaiCountState();
}

class _SaiCountState extends State<SaiCount> with SingleTickerProviderStateMixin {
  bool started = false;
  int count = 0;
  Animation<double> animation;
  AnimationController controller;
  ui.Image image;
  double _fraction = 0.0;
  bool start = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);

    animation = Tween(begin: 0.0, end: 40.0).animate(controller)
      ..addListener(() {
        setState(() {
          _fraction = animation.value;
        });
      });

    if (count > 0) {
      controller.repeat();
    }

    init();
  }

  Future<Null> init() async {
    final ByteData data = await rootBundle.load('assets/images/SaudiarabiaFlag.png');
    image = await loadImage(new Uint8List.view(data.buffer));
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
          children: <Widget>[
            Text(
              "সাফা থেকে শুরু করুন এবং মারওয়ায় পৌঁছে সাফা এবং মারওয়াতে ট্যাপ করুন",
              textAlign: TextAlign.center,
            ),
            RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                onPressed: start && count % 2 == 0
                    ? null
                    : () {
                        if (count < 7) {
                          setState(() {
                            count++;
                            start = true;
                          });
                        }
                      },
                child: Text("মারওয়া")),
            SizedBox(
              height: 6,
            ),
            Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  foregroundPainter: SieWidget(count, _fraction, start),
                )),
            SizedBox(
              height: 6,
            ),
            RaisedButton(
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0),
                ),
                onPressed: start && count % 2 != 0
                    ? null
                    : () {
                        if (count < 7) {
                          setState(() {
                            count++;
                            start = true;
                          });
                        }
                      },
                child: Text("সাফা")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                    padding: EdgeInsets.all(0),
                    textColor: Colors.white,
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DuaDetailPage(DuaCategory(id: 1, name: "adas")),
                          ));
                    },
                    child: Text("দু'আ তালিকা")),
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
