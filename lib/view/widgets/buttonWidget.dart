import 'package:flutter/material.dart';
import 'package:portfolio/valueApp.dart';

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
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    valueApp = ValueApp(size: MediaQuery.of(context).size);
    return Wrap(
      children: [
        Container(
          height: valueApp.getHeightSize(),
          width: valueApp.getWidthtSize(),
          child: OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: widget.backgroundColor,
              primary: widget.textColor,
              side: BorderSide(
                color: widget.borderColor,
                width: widget.borderWidth,
              ),
            ),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: widget.textSize,
                color: widget.textColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
