import 'dart:math';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class TawafWidget extends CustomPainter {
  int count;
  double _fraction;
  Paint completeArcPaint;
  Paint outerCirclePaint;
  Paint linePaint;

  TawafWidget(this.count, this._fraction,  BuildContext context) {
    //this is base circle
    outerCirclePaint = Paint()
      ..strokeWidth = 4
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    completeArcPaint = Paint()
      ..strokeWidth = 4
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

    double scale = 10;

    double angle = 2 * pi * _fraction;
    if (count == 1) {
      canvas.drawCircle(center, radius + scale, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 2) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);

      canvas.drawCircle(center, radius + scale *2, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *2), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 3) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);
      canvas.drawCircle(center, radius + scale *2, completeArcPaint);

      canvas.drawCircle(center, radius + scale *3, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *3), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 4) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);
      canvas.drawCircle(center, radius + scale *2, completeArcPaint);
      canvas.drawCircle(center, radius + scale *3, completeArcPaint);

      canvas.drawCircle(center, radius + scale *4, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *4), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 5) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);
      canvas.drawCircle(center, radius + scale *2, completeArcPaint);
      canvas.drawCircle(center, radius + scale *3, completeArcPaint);
      canvas.drawCircle(center, radius + scale *4, completeArcPaint);

      canvas.drawCircle(center, radius + scale *5, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *5), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 6) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);
      canvas.drawCircle(center, radius + scale *2, completeArcPaint);
      canvas.drawCircle(center, radius + scale *3, completeArcPaint);
      canvas.drawCircle(center, radius + scale *4, completeArcPaint);
      canvas.drawCircle(center, radius + scale *5, completeArcPaint);

      canvas.drawCircle(center, radius + scale *6, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *6), 2 * pi * 0.17, -angle, false, completeArcPaint);
    } else if (count == 7) {
      canvas.drawCircle(center, radius + scale, completeArcPaint);
      canvas.drawCircle(center, radius + scale *2, completeArcPaint);
      canvas.drawCircle(center, radius + scale *3, completeArcPaint);
      canvas.drawCircle(center, radius + scale *4, completeArcPaint);
      canvas.drawCircle(center, radius + scale *5, completeArcPaint);
      canvas.drawCircle(center, radius + scale *6, completeArcPaint);

      canvas.drawCircle(center, radius + scale *7, outerCirclePaint); // this draws main outer circle
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius + scale *7), 2 * pi * 0.17

          , -angle, false, completeArcPaint);
    }

    //makam ibrahim
    canvas.drawCircle(center.translate(scale *4, 0), 3, Paint()
      ..strokeWidth = 2
      ..color = Colors.brown[300]); // this draws main outer circle

    var square = Rect.fromCenter(center: center.translate(0, 20), width: scale *4, height: scale *4);
    canvas.drawRect(square, linePaint);

    // triangleInSquare;
    var path = Path()
      ..moveTo(center.dx + scale * 2, center.dy + scale*3)
      ..lineTo(center.dx + scale * 2, center.dy + scale*4)
      ..lineTo(center.dx + scale, center.dy + scale *4)
      ..close();
    canvas.drawPath(path,   Paint()
      ..strokeWidth = 2
      ..color = Colors.black);

    //prayerArea
    canvas.drawArc(Rect.fromCircle(center: center.translate(0, -scale), radius: scale*2), pi, 2 * pi * 0.5, false,  Paint()
      ..strokeWidth = 4
      ..color = Colors.grey[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round);

//starting path
    var startingLine = Path()
      ..moveTo(center.dx + scale *2, center.dy + scale * 4)
      ..lineTo(size.width, size.height);
    canvas.drawPath(startingLine, Paint()
      ..strokeWidth = 2
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round);


    //duapath
    var duaLine = Path()
      ..moveTo(center.dx - scale *2, center.dy + scale *4)
      ..lineTo(0, size.height);
    canvas.drawPath(duaLine, linePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
