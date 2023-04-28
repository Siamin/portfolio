import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:portfolio/colorApp.dart';

class LoadingWidget extends StatefulWidget {
  final double?  width,height;
  const LoadingWidget({Key? key, this.width, this.height}) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: ColorApp().DarkColor,
      child: Center(
        child:  LoadingAnimationWidget.discreteCircle(
          color: ColorApp().PrimaryColor,
          secondRingColor: ColorApp().SecondaryColor,
          thirdRingColor: ColorApp().SecondaryDarkColor,
          size: 100,
        ),
      ),
    );
  }
}
