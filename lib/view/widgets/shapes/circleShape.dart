import 'package:flutter/cupertino.dart';

class CircleShape extends CustomPainter {
  final Color colorShape;
  final double radius;

  CircleShape({required this.radius,required this.colorShape});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = colorShape
      ..strokeWidth = 15;

    Offset center = Offset(size.width *0.5, size.height *0.5);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleUnderShape extends CustomPainter {
  Color colorShape;

  CircleUnderShape({required this.colorShape});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = colorShape
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.5, size.height*1.4, 0, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}