import 'package:flutter/material.dart';

class VerticalLine extends CustomPainter {
  const VerticalLine();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = size.width
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      const Offset(0, 10),
      Offset(0, size.height - 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
