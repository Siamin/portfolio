import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/socialmediaModel.dart';
import 'package:portfolio/view/widgets/socialMediaWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';

class FooterScreen extends StatefulWidget {
  final bool isDesktop, isTablet;

  const FooterScreen({
    Key? key,
    this.isDesktop = false,
    this.isTablet = false,
  }) : super(key: key);

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  late Size size;
  late double sumScreen;
  SocialMediaModel socialMediaModel = SocialMediaModel(
      facebook: "@facebook",
      linkedin: "@linkdin",
      instagram: "instagram",
      mail: "amin@gmail.com");
  List<String> footerSkill = [
    "@2022 Jayjay Dinero Dinero",
    "Fullstack Developer",
    "UI Designer",
    "Data Analyst",
    "Designed by @ernestechie",
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        children: [
          getRowMyInformation(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SocialMediaWidget(
              model: socialMediaModel,
              isDesktop: widget.isDesktop,
              alignment:
                  widget.isDesktop ? Alignment.centerLeft : Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  getRowMyInformation() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < footerSkill.length; i++)
            generateText(text: footerSkill[i]),
        ],
      );

  generateText({required String text}) => Wrap(children: [
        TextWidget(
          text: text,
          textColor: ColorApp().whiteLiteColor,
          fontSize: sumScreen * 0.007,
          textAlign: TextAlign.center,
          width: widget.isDesktop
              ? size.width * 0.9 / footerSkill.length
              : (size.width * 0.6) / footerSkill.length,
        ),
      ]);
}
