import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/view/widgets/shapes/circleShape.dart';

class ImageWidget extends StatefulWidget {
  final double height, width;
  final String pathAssets;
  final Color backgroundColor, circleColor;

  const ImageWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.pathAssets,
    required this.backgroundColor,
    required this.circleColor,
  }) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          child: Container(
          ),
          foregroundPainter: CircleShape(
            colorShape: widget.circleColor,
            radius: widget.height *0.5,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: widget.height * 0.5),
          child: Image.asset(
            widget.pathAssets,
            height: widget.height * 0.9,
            width: widget.width * 0.9,
          ),
        ),
        CustomPaint(
          child: Container(
            height: widget.height,
            width: widget.width,
          ),
          foregroundPainter: CircleUnderShape(
            colorShape: widget.backgroundColor,
          ),
        )
      ],
    );
  }
}
