import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

class TawafWidget extends CustomPainter {
  double currentProgress;
  double _fraction;
  Paint completeArc;
  Paint outerCircle;
  Paint linePaint;

  ui.Image image;

  TawafWidget(this.currentProgress,this._fraction,this.image){
    //this is base circle
    outerCircle = Paint()
      ..strokeWidth = 10
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    completeArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;


    linePaint = Paint()
      ..strokeWidth = 10
      ..color = Colors.redAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 3, size.height / 3) - 10;

    canvas.drawCircle(
        center, radius, outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, completeArc);

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromCenter(center: center, width: radius,height: radius);
    canvas.drawRect(rect, outerCircle);


    var path = Path()..moveTo(center.dx, center.dy)..lineTo(size.width, size.height);
    canvas.drawPath(path, outerCircle);

    var path2 = Path()..moveTo(center.dx, center.dy)..lineTo(0, size.height);
    canvas.drawPath(path2, outerCircle);

    var rect1 = Offset(0.0, 0.0) & size;

    canvas.drawArc(rect1, -pi / 2, pi * 2 * _fraction, false, completeArc);

    if(image!=null) {
//      ByteData data = image.toByteData();
      canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
