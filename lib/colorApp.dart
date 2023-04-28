import 'dart:ui';

import 'package:flutter/material.dart';

class ColorApp {
  Color whiteColor = const Color.fromRGBO(255, 255, 255, 1);
  Color whiteLiteColor = const Color.fromRGBO(245, 245, 245, 1);
  Color LightColor = const Color.fromRGBO(245, 245, 245, 1);
  Color LowPriorityColor = const Color.fromRGBO(132, 129, 145, 1);
  Color PrimaryColor = const Color.fromRGBO(117, 98, 224, 1);
  Color SecondaryColor = const Color.fromRGBO(40, 33, 98, 1);
  Color DarkColor = const Color.fromRGBO(0, 0, 54, 1);
  Color GaryColor = const Color.fromRGBO(49, 49, 63, 1);
  Color GaryLiteColor = const Color.fromRGBO(52, 52, 65, 1);
  Color transparent = Colors.transparent;

  MaterialColor materialApp() {
    final Map<int, Color> shades = {
      50: Color.fromRGBO(117, 98, 224, .1),
      100: Color.fromRGBO(117, 98, 224, .2),
      200: Color.fromRGBO(117, 98, 224, .3),
      300: Color.fromRGBO(117, 98, 224, .4),
      400: Color.fromRGBO(117, 98, 224, .5),
      500: Color.fromRGBO(117, 98, 224, .6),
      600: Color.fromRGBO(117, 98, 224, .7),
      700: Color.fromRGBO(117, 98, 224, .8),
      800: Color.fromRGBO(117, 98, 224, .9),
      900: Color.fromRGBO(117, 98, 224, 1),
    };

    return MaterialColor(PrimaryColor.value, shades);
  }
}
