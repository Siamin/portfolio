import 'dart:ui';

import 'package:portfolio/colorApp.dart';

class ServiceModel {
  String iconName, title, description;
  Color? borderColor = ColorApp().PrimaryColor,
      titleColor = ColorApp().whiteLiteColor;

  ServiceModel({
    required this.iconName,
    required this.title,
    required this.description,
    this.borderColor,
    this.titleColor,
  });

  getPath() => 'assets/icons/${iconName}.png';

  getBorderColor({required int number, bool isPhone = false}) {
    if (number == 2 && isPhone) return ColorApp().whiteColor;
    int mode = isPhone ? 3 : 2;
    return number % mode == 0 ? ColorApp().whiteColor : ColorApp().PrimaryColor;
  }

  getTitleColor({required int number, bool isPhone = false}) {
    if (number == 2 && isPhone) return ColorApp().PrimaryColor;
    int mode = isPhone ? 3 : 2;
    return number % mode == 0 ? ColorApp().PrimaryColor : ColorApp().whiteColor;
  }

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        iconName: json["iconName"],
        title: json["title"],
        description: json["description"],
      );
}
