import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/valueApp.dart';
import 'package:portfolio/view/widgets/serviecWidget.dart';
import 'package:portfolio/view/widgets/skillWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutMeScreen extends StatefulWidget {
  final bool isTablet;
  final bool isDesktop;
  final bool isPhone;
  final DataModel dataModel;

  const AboutMeScreen({
    Key? key,
    this.isTablet = false,
    this.isDesktop = false,
    this.isPhone = false,
    required this.dataModel,
  }) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  late Size size;
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    valueApp = ValueApp(size: size,
        isPhone: widget.isPhone,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet);

    return Padding(
      padding: EdgeInsets.only(top: valueApp.getPaddingSize((widget.isPhone ? 1 : 13))),
      child: Container(
        width: size.width,
        // height: size.height,
        child: widget.isPhone ? viewPhone() : viewBody(),
      ),
    );
  }

  viewPhone() => ListView(
        children: getListBody(),
      );

  viewBody() => Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: getListBody(),
          )
        ],
      );

  getListBody() => [
        TextWidget(
          text: AppLocalizations.of(context)!.aboutMe,
          textColor: ColorApp().PrimaryColor,
          fontSize: valueApp.getTitleSizeH1(),
        ),
        Padding(
          padding:  EdgeInsets.only(top: valueApp.getPaddingSize(1)),
          child: TextWidget(
            text: widget.dataModel.aboutMe,
            textColor: ColorApp().whiteColor,
            fontSize: valueApp.getSubtitleSizeH2(),
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Row(
          children: [
            Expanded(
              flex: widget.isPhone ? 2 : 1,
              child: TextWidget(
                text: "${widget.dataModel.howYearsExperience}+",
                textColor: ColorApp().PrimaryColor,
                fontSize: valueApp.getTitleSizeH0(),
              ),
            ),
            Expanded(
              flex: 7,
              child: TextWidget(
                text: widget.dataModel.descriptionExperience,
                textColor: ColorApp().whiteColor,
                fontSize: valueApp.getSubtitleSizeH2(),
              ),
            ),
          ],
        ),
        SkillWidget(
          skillModel: widget.dataModel.experiences,
          isTablet: widget.isTablet,
          isPhone: widget.isPhone,
          isDesktop: widget.isDesktop,
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        TextWidget(
          text: AppLocalizations.of(context)!.serviceTitle,
          textColor: ColorApp().PrimaryColor,
          fontSize: valueApp.calScreen() * 0.02,
        ),
        ServiceWidget(
          serviceModel: widget.dataModel.services,
          isDesktop: widget.isDesktop,
          isTablet: widget.isTablet,
          isPhone: widget.isPhone,
        )
      ];
}
