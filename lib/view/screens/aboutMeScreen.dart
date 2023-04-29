import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/widgets/serviecWidget.dart';
import 'package:portfolio/view/widgets/skillWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AboutMeScreen extends StatefulWidget {
  final bool isTablet;
  final bool isDesktop;
  final DataModel dataModel;

  const AboutMeScreen({
    Key? key,
    this.isTablet = false,
    this.isDesktop = false,
    required this.dataModel,
  }) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  late Size size;
  late double sumScreen;

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
                  text: AppLocalizations.of(context)!.aboutMe,
                  textColor: ColorApp().PrimaryColor,
                  fontSize: sumScreen * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextWidget(
                    text: widget.dataModel.aboutMe,
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
                          text: "${widget.dataModel.howYearsExperience}+",
                          textColor: ColorApp().PrimaryColor,
                          fontSize: sumScreen * 0.04,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextWidget(
                          text:widget.dataModel.descriptionExperience,
                          textColor: ColorApp().whiteColor,
                          fontSize: size.width * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
                SkillWidget(
                  skillModel: widget.dataModel.experiences,
                  isTablet: widget.isTablet,
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextWidget(
                  text: AppLocalizations.of(context)!.serviceTitle,
                  textColor: ColorApp().PrimaryColor,
                  fontSize: size.width * 0.02,
                ),
                ServiceWidget(
                  serviceModel: widget.dataModel.services,
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
