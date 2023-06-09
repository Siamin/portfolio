import 'package:flutter/material.dart';
class OutlinedButtonWidget extends StatefulWidget {
  final Color backgroundColor, textColor;
  final Color borderColor;
  final double borderWidth;
  final double iconSize;
  final double textSize;
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const OutlinedButtonWidget(
      {Key? key,
      required this.backgroundColor,
      required this.textColor,
      this.borderColor = Colors.transparent,
      this.borderWidth = 0.0,
      required this.iconSize,
      required this.textSize,
      required this.icon,
      required this.text,
      this.onPressed})
      : super(key: key);

  @override
  State<OutlinedButtonWidget> createState() => _OutlinedButtonWidgetState();
}

class _OutlinedButtonWidgetState extends State<OutlinedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        // primary: widget.textColor,
        side: BorderSide(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
      ),
      onPressed: () {
        widget.onPressed!.call();
      },
      icon: Icon(
        widget.icon,
        size: widget.iconSize,
      ),
      label: Text(
        widget.text,
        style: TextStyle(
          fontSize: widget.textSize,
        ),
      ),
    );
  }
}
