import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class SieWidget extends CustomPainter {
  double count;

  SieWidget(this.count);

  @override
  void paint(Canvas canvas, Size size) {
    //this is base circle
    Paint outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    var rect2 = Rect.fromCenter(center: center, width: radius, height: radius);
    canvas.drawRect(rect2, completeArc);

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromCenter(center: center, width: radius,height: size.height);
    canvas.drawRect(rect, outerCircle);

    // Create a rectangle with size and width same as the canvas
//  if(count%2==0) {
//    _getImage().then((onValue)=>{
//      canvas.drawImage(onValue, center, outerCircle)
//    });
//  }else {
//canvas.
//  }

  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = new Completer<ui.Image>();
    new AssetImage('assets/images/BangladeshFlag.png')
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) => completer.complete(info.image)));
    return completer.future;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
