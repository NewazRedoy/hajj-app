import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TawafWidget extends CustomPainter {
  int count;
  double _fraction;
  Paint completeArc;
  Paint outerCircle;
  Paint linePaint;

  ui.Image image;

  TawafWidget(this.count, this._fraction, this.image, BuildContext context) {
    //this is base circle
    outerCircle = Paint()
      ..strokeWidth = 8
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    completeArc = Paint()
      ..strokeWidth = 8
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    linePaint = Paint()
      ..strokeWidth = 2
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 3, size.height / 3) - 10;

    double angle = 2 * pi * _fraction;
    if (count == 1) {
      canvas.drawCircle(center, radius + 10, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 10), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 2) {
      canvas.drawCircle(center, radius + 10, completeArc);

      canvas.drawCircle(center, radius + 20, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 20), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 3) {
      canvas.drawCircle(center, radius + 10, completeArc);
      canvas.drawCircle(center, radius + 20, completeArc);

      canvas.drawCircle(center, radius + 30, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 30), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 4) {
      canvas.drawCircle(center, radius + 10, completeArc);
      canvas.drawCircle(center, radius + 20, completeArc);
      canvas.drawCircle(center, radius + 30, completeArc);

      canvas.drawCircle(center, radius + 40, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 40), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 5) {
      canvas.drawCircle(center, radius + 10, completeArc);
      canvas.drawCircle(center, radius + 20, completeArc);
      canvas.drawCircle(center, radius + 30, completeArc);
      canvas.drawCircle(center, radius + 40, completeArc);

      canvas.drawCircle(center, radius + 50, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 50), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 6) {
      canvas.drawCircle(center, radius + 10, completeArc);
      canvas.drawCircle(center, radius + 20, completeArc);
      canvas.drawCircle(center, radius + 30, completeArc);
      canvas.drawCircle(center, radius + 40, completeArc);
      canvas.drawCircle(center, radius + 50, completeArc);

      canvas.drawCircle(center, radius + 60, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 60), 2 * pi * 0.14, -angle, false, completeArc);
    } else if (count == 7) {
      canvas.drawCircle(center, radius + 10, completeArc);
      canvas.drawCircle(center, radius + 20, completeArc);
      canvas.drawCircle(center, radius + 30, completeArc);
      canvas.drawCircle(center, radius + 40, completeArc);
      canvas.drawCircle(center, radius + 50, completeArc);
      canvas.drawCircle(center, radius + 60, completeArc);

      canvas.drawCircle(center, radius + 70, outerCircle); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + 70), 2 * pi * 0.14, -angle, false, completeArc);
    }

//    var dx = center.dx + radius * cos(-angle);
//    var dy = center.dy + radius * sin(-angle);
//  var handler =  Offset(dx, dy);
//    canvas.drawCircle(handler, 4, completeArc); // this draws main outer circle

    var square = Rect.fromCenter(center: center.translate(0, 20), width: 80, height: 80);
    canvas.drawRect(square, linePaint);

    // triangleInSquare;
    var path = Path()
      ..moveTo(center.dx + 40, center.dy + 40)
      ..lineTo(center.dx + 40, center.dy + 60)
      ..lineTo(center.dx + 20, center.dy + 60)
      ..close();
    canvas.drawPath(path, linePaint);
    //prayerArea
    canvas.drawArc(Rect.fromCircle(center: center.translate(0, -40), radius: 40), pi, 2 * pi * 0.5, false, completeArc);

    var duaPath = Path()
      ..moveTo(center.dx + 40, center.dy + 60)
      ..lineTo(size.width, size.height);
    canvas.drawPath(duaPath, linePaint);

    var startPath = Path()
      ..moveTo(center.dx - 40, center.dy + 60)
      ..lineTo(0, size.height);
    canvas.drawPath(startPath, linePaint);

    if (image != null) {
//      ByteData data = image.toByteData();
//      canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
