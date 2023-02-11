import 'package:flutter/material.dart';

class BubbleModal extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint mainPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final Paint trianglePaint = Paint()..color = Colors.black;

    final Path path = Path()
      ..moveTo(10, 0)
      ..lineTo(size.width - 10, 0)
      ..quadraticBezierTo(size.width, 0, size.width, 10)
      ..lineTo(size.width, size.height + 10)
      ..quadraticBezierTo(size.width - 10, size.height, size.width - 20, size.height)
      ..lineTo(10, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 10)
      ..lineTo(0, 10)
      ..quadraticBezierTo(0, 0, 10, 0);
    // ..lineTo(size.width, size.height)
    // ..lineTo(size.width, size.height + 10)
    // ..quadraticBezierTo(size.width - 10, size.height, size.width - 20, size.height);

    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
      bottomLeft: Radius.circular(15),
    );
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawPath(path, mainPaint);
    // canvas.drawRRect(outer, mainPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
