import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/models/skillModel.dart';
import 'package:portfolio/models/socialmediaModel.dart';

class DataModel {
  String name, family, fullName, descriptionMe, aboutMe, descriptionExperience;
  int howYearsExperience;
  List<SkillModel> experiences;
  List<ServiceModel> services;
  List<ProjectModel> featured;
  SocialMediaModel socialMedia;
  List<String> footerLinks;

  DataModel({
    required this.name,
    required this.family,
    required this.fullName,
    required this.descriptionMe,
    required this.aboutMe,
    required this.descriptionExperience,
    required this.howYearsExperience,
    required this.experiences,
    required this.services,
    required this.featured,
    required this.socialMedia,
    required this.footerLinks,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        name: json["name"],
        family: json["family"],
        fullName: json["fullName"],
        descriptionMe: json["descriptionMe"],
        aboutMe: json["aboutMe"],
        descriptionExperience: json["descriptionExperience"],
        howYearsExperience: json['howYearsExperience'].toInt(),
        experiences: List<SkillModel>.from(
            json["experiences"].map((x) => SkillModel.fromJson(x))),
        services: List<ServiceModel>.from(
            json["services"].map((x) => ServiceModel.fromJson(x))),
        featured: List<ProjectModel>.from(
            json["featured"].map((x) => ProjectModel.fromJson(x))),
        footerLinks: List<String>.from(json["footerLinks"].map((x) => x)),
        socialMedia: SocialMediaModel.fromJson(json['socialMedia']),
      );

// Map<String, dynamic> toJson() => {
//   "id": id,
//   "title": title,
//   "course_id": courseId,
//   "description": description,
//   "order": order,
//   "percent": percent,
//   "items": List<dynamic>.from(items.map((x) => x.toJson())),
// };
}
