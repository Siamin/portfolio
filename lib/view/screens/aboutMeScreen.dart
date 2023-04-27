import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/models/skillModel.dart';
import 'package:portfolio/view/widgets/serviecWidget.dart';
import 'package:portfolio/view/widgets/skillWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';

class AboutMeScreen extends StatefulWidget {
  final bool isTablet;
  final bool isDesktop;

  const AboutMeScreen({Key? key, this.isTablet = false, this.isDesktop = false})
      : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  late Size size;
  late double sumScreen;
  late List<SkillModel> skillModel = [
    SkillModel(title: "UI & UX", subTitle: "DESIGNING", iconName: "uiux.png"),
    SkillModel(
        title: "WEB", subTitle: "DEVELOPMENT", iconName: "developer.png"),
    SkillModel(
        title: "MOBILE", subTitle: "DEVELOPMENT", iconName: "android.png"),
    SkillModel(
        title: "WEB SCRAPING", subTitle: "WITH PYTHON", iconName: "python.png"),
  ];
  late List<ServiceModel> serviceModel = [
    ServiceModel(
      title: "UI & UX DESIGNING",
      description: "I design beautiful web iterfaces with Figma and Adove XD",
      iconName: "uiux.png",
      titleColor: ColorApp().whiteColor,
      borderColor: ColorApp().PrimaryColor,
    ),
    ServiceModel(
      title: "WEB DEVELOPMENT",
      description:
          "I create beautiful iterfaces with simple HTML, CSS, & JavaScript and also frameworks like Angular and ReactJS",
      iconName: "developer.png",
      titleColor: ColorApp().PrimaryColor,
      borderColor: ColorApp().whiteColor,
    ),
    ServiceModel(
      title: "MOBILE DEVELOPMENT",
      description:
          "I am an expert mobile developer. I have experience using Flutter and React Native.",
      iconName: "android.png",
      titleColor: ColorApp().whiteColor,
      borderColor: ColorApp().PrimaryColor,
    ),
    ServiceModel(
      title: "VERSION CONTROL",
      description:
          "I can use version control systems well, and Git & Mecurial are my go-to tool.",
      iconName: "git.png",
      titleColor: ColorApp().PrimaryColor,
      borderColor: ColorApp().whiteColor,
    ),
    ServiceModel(
      title: "NPM AND NODEJS",
      description:
          "I have core understanding of NPM. I can also develop general purpose applications with NodeJS",
      iconName: "js.png",
      titleColor: ColorApp().whiteColor,
      borderColor: ColorApp().PrimaryColor,
    ),
    ServiceModel(
      title: "WEB SCRAPING",
      description:
          "I can collect content and data from the internet then manipulate and analyze as needed.",
      iconName: "web.png",
      titleColor: ColorApp().PrimaryColor,
      borderColor: ColorApp().whiteColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: size.width,
        // height: size.height,
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "About me:",
                  textColor: ColorApp().PrimaryColor,
                  fontSize: sumScreen * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextWidget(
                    text:
                        "Hi, my name is Jayjay Dinero Dinero, i am a Fullstack web developer, UI designer, and Mobile developer. I jhave honed my skills in Web Development and advance i have core understanding of advance UI design principles.Here are the major skiills i have. ",
                    textColor: ColorApp().whiteColor,
                    fontSize: sumScreen * 0.012,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: sumScreen * 0.008),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextWidget(
                          text: "5+",
                          textColor: ColorApp().PrimaryColor,
                          fontSize: sumScreen * 0.04,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextWidget(
                          text:
                              "Years of experience. Specialised in building apps, while ensuring a seamless web experience for end users.",
                          textColor: ColorApp().whiteColor,
                          fontSize: size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                SkillWidget(
                  skillModel: skillModel,
                  isTablet: widget.isTablet,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextWidget(
                  text: "The services i offer:",
                  textColor: ColorApp().PrimaryColor,
                  fontSize: size.width * 0.02,
                ),
                ServiceWidget(
                  serviceModel: serviceModel,
                  isDesktop: widget.isDesktop,
                  isTablet: widget.isTablet,
                )
              ],
            )
          ],
        ),
      ),
    );
  }


}
