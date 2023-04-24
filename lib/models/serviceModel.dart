import 'dart:ui';

class ServiceModel {
  String iconName, title, description;
  Color borderColor, titleColor;

  ServiceModel(
      {required this.iconName,
      required this.title,
      required this.description,
      required this.borderColor,
      required this.titleColor});

  getPath() => 'assets/icons/${iconName}';
}
