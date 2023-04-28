import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';

class TextFieldWidget extends StatefulWidget {
  final String labelText;
  final double width, margen, circular;
  final TextInputType keyboardType;
  final Alignment alignment;
  final int maxLines;

  const TextFieldWidget({
    Key? key,
    required this.labelText,
    this.width = 500,
    this.keyboardType = TextInputType.text,
    this.alignment = Alignment.centerLeft,
    this.margen = 8.0,
    this.circular = 8, this.maxLines=1,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment,
      child: Padding(
        padding: EdgeInsets.all(widget.margen),
        child: Container(
          width: widget.width,
          child: TextFormField(
            cursorColor: ColorApp().GaryLiteColor,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(color: ColorApp().whiteLiteColor),
              border: InputBorder.none,
              filled: true,
              fillColor: ColorApp().GaryColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.circular),
                ),
                borderSide: BorderSide(
                  color: ColorApp().GaryLiteColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.circular),
                ),
                borderSide: BorderSide(
                  width: 4,
                  color: ColorApp().GaryColor,
                ),
              ),
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
      ),
    );
  }
}
