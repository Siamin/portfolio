class LanguageModel{
  String title,type;
  String icon;

  LanguageModel({required this.title, required this.icon,required this.type});

  getPath()=>"assets/icons/${icon}.png";
}