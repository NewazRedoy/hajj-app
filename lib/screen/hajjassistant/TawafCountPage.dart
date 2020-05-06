import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hajjapp/model/DuaCategory.dart';
import 'package:hajjapp/model/Topic.dart';
import 'package:hajjapp/screen/dua/DuaDetailPage.dart';
import 'package:hajjapp/widgets/Search&Settings.dart';
import 'package:hajjapp/widgets/TawafWidget.dart';

class TawafCountPage extends StatefulWidget {
  final Topic topic;

  TawafCountPage(this.topic);

  @override
  _TawafCountPageState createState() => _TawafCountPageState();
}

class _TawafCountPageState extends State<TawafCountPage> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  Animation<double> animation;
  int count = 0;
  AnimationController controller;
  ui.Image image;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: Text("প্রতিবার হাজরে আসওয়াদের কাছে পৌঁছে নিচের বাটন ট্যাপ করুন"),
            ),
            SizedBox(
              height: 8,
            ),
            Text("$count/7"),
            SizedBox(
              height: 8,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: CustomPaint(foregroundPainter: TawafWidget(count, _fraction, image, context)),
            ),
            SizedBox(
              height: 8,
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
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
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DuaDetailPage(DuaCategory(id: 1, name: "adas")),
                    ));
              },
              child: Text("দু'আ তালিকা"),
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
