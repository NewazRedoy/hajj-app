import 'dart:math';

import 'package:flutter/material.dart';

class TawafWidget extends CustomPainter {
  double currentProgress;

  TawafWidget(this.currentProgress);

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
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

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


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
