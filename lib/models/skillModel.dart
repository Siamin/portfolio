class SkillModel {
  String title, subTitle, iconName;

  SkillModel(
      {required this.title, required this.subTitle, required this.iconName});

  getPath() => 'assets/icons/${iconName}';
}
