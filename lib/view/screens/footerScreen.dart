import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/socialmediaModel.dart';
import 'package:portfolio/view/widgets/socialMediaWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';

class FooterScreen extends StatefulWidget {
  final bool isDesktop, isTablet;
  final SocialMediaModel socialMediaModel;
  final List<String> footerSkill;
  const FooterScreen({
    Key? key,
    this.isDesktop = false,
    this.isTablet = false, required this.socialMediaModel, required this.footerSkill,
  }) : super(key: key);

  @override
  State<FooterScreen> createState() => _FooterScreenState();
}

class _FooterScreenState extends State<FooterScreen> {
  late Size size;
  late double sumScreen;


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
              model: widget.socialMediaModel,
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
          for (int i = 0; i < widget.footerSkill.length; i++)
            generateText(text: widget.footerSkill[i]),
        ],
      );

  generateText({required String text}) => Wrap(children: [
        TextWidget(
          text: text,
          textColor: ColorApp().whiteLiteColor,
          fontSize: sumScreen * 0.007,
          textAlign: TextAlign.center,
          width: widget.isDesktop
              ? size.width * 0.9 / widget.footerSkill.length
              : (size.width * 0.6) / widget.footerSkill.length,
        ),
      ]);
}
