class SkillModel {
  String title, subTitle, iconName;

  SkillModel(
      {required this.title, required this.subTitle, required this.iconName});

  getPath() => 'assets/icons/${iconName}.png';

  factory SkillModel.fromJson(Map<String, dynamic> json) => SkillModel(
        title: json["title"],
        subTitle: json["subTitle"],
        iconName: json["iconName"],
      );
}
