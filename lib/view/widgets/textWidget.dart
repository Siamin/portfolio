import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String text;
  final fontSize;
  final Color textColor;
  final TextAlign textAlign;

  const TextWidget(
      {Key? key,
      required this.text,
      this.fontSize = 14.0,
      required this.textColor, this.textAlign=TextAlign.start,
      })
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      child: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.fontSize,
          color: widget.textColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: widget.textAlign,
      ),
    );
  }
}
