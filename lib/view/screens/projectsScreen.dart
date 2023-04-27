import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/view/widgets/projectWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';

class ProjectsScreen extends StatefulWidget {
  final bool isPhone, isTablet, isDesktop;

  const ProjectsScreen({
    Key? key,
    this.isPhone = false,
    this.isTablet = false,
    this.isDesktop = false,
  }) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late Size size;
  late double sumScreen;

  List<ProjectModel> models = [
    ProjectModel(
        title: "TWINDER",
        subTitle:
            "A live Geolocation app for finding tweets and twitter users around you.",
        description: "",
        imageAddress: ["map.png"]),
    ProjectModel(
        title: "LIVENTS",
        subTitle:
            "A video streaming app with live Geolocation, for streaming events.",
        description: "",
        imageAddress: ["live.png"]),
    ProjectModel(
        title: "MOOVE",
        subTitle:
            "Mobile app for booking instant pickup & dropoff accross major cities.",
        description: "",
        imageAddress: ["move.png"]),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: widget.isPhone ? 8 : 32),
        child: Column(
          children: [
            TextWidget(
              text: "Featured projects:",
              textColor: ColorApp().PrimaryColor,
              fontSize: size.width * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TextWidget(
                text:
                    "I have worked on many projects over the course of being a Web Developer, here are a few of my live, real-world projects",
                textColor: ColorApp().whiteColor,
                fontSize: size.width * 0.0095,
              ),
            ),
            ProjectWidget(
              projectModels: models,
              isDesktop: widget.isDesktop,
              isTablet: widget.isTablet,
              isPhone: widget.isPhone,
            )
          ],
        ),
      ),
    );
  }
}
