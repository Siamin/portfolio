import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Color backgroundColor, textColor;
  final Color borderColor;
  final double borderWidth;
  final double textSize;
  final String text;
  final VoidCallback? onPressed;
  final Alignment alignment;

  const ButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0.0,
    required this.textSize,
    required this.text,
    this.alignment = Alignment.centerLeft,
    this.onPressed,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        OutlinedButton(
          onPressed: widget.onPressed,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.textSize,
              color: widget.textColor,
            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            primary: widget.textColor,
            side: BorderSide(
              color: widget.borderColor,
              width: widget.borderWidth!,
            ),
          ),
        )
      ],
    );
  }
}
