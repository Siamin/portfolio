class ProjectModel {
  String title, subTitle, description;
  List<String> imageAddress;
  String? websitLink, gitRepoLink;

  ProjectModel({
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageAddress,
    this.websitLink,
    this.gitRepoLink,
  });

  bool isWebsite() => this.websitLink!.isEmpty ? false : true;

  bool isRepository() => this.gitRepoLink!.isEmpty ? false : true;

  getPath(int index) => 'assets/images/${imageAddress[index]}';

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json["title"],
        subTitle: json["subTitle"],
        description: json["description"],
        imageAddress: List<String>.from(json["imageAddress"].map((x) => x)),
        websitLink: json["websitLink"],
        gitRepoLink: json["gitRepoLink"],
      );
}
