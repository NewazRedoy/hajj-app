import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class SieWidget extends CustomPainter {
  int count;
  double fraction;
  Paint runningAreaPaint;
  Paint outerCircle;
  Paint arrowPaint;
  bool start;

  SieWidget(this.count, this.fraction, this.start) {
    //this is base circle

    outerCircle = Paint()
      ..strokeWidth = 1
      ..color = Colors.black
      ..style = PaintingStyle.stroke;

    runningAreaPaint = Paint()
      ..strokeWidth = 10
      ..color = Colors.greenAccent
      ..strokeCap = StrokeCap.round;

    arrowPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.fill
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double width = 100;

    var runningArea = Rect.fromCenter(center: center.translate(0, 30), width: width, height: 70);
    canvas.drawRect(runningArea, runningAreaPaint);

    // Create a rectangle with size and width same as the canvas
    var rect = Rect.fromCenter(center: center, width: width, height: size.height);
    canvas.drawRect(rect, outerCircle);

    if (start && count > 0 && count < 7) {
      if (count % 2 == 0) {
        // Draw the arrow.
        const double w = 8.0;
        double h = 5.0;
        double arrowY = 20 + fraction;
        final Path path = Path();
        path.moveTo(center.dx, arrowY + h); // top of the arrow
        path.lineTo(center.dx + w, arrowY - h);
        path.lineTo(center.dx - w, arrowY - h);
        path.close();

        canvas.drawPath(path, arrowPaint);
      } else {
        // Draw the arrow.
        const double w = 8.0;
        double h = 5.0;
        double arrowY = size.height - 20 - fraction;
        final Path path = Path();
        path.moveTo(center.dx, arrowY - h); // top of the arrow
        path.lineTo(center.dx + w, arrowY + h);
        path.lineTo(center.dx - w, arrowY + h);
        path.close();
        canvas.drawPath(path, arrowPaint);
      }
    }

    final textSpan = TextSpan(
      text: '$count/7',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(40, center.dy - 40);
    textPainter.paint(canvas, offset);

    final textSpan2 = TextSpan(
      text: 'ei sthane purushra\nektu dhuro hatben',
      style: TextStyle(
        color: Colors.grey,
        fontSize: 14,
      ),
    );
    final textPainter2 = TextPainter(
      text: textSpan2,
      textDirection: TextDirection.ltr,
    );
    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    textPainter2.paint(canvas, center.translate(55, 15));
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
