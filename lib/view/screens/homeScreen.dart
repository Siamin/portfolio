import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/valueApp.dart';
import 'package:portfolio/view/widgets/ImageWidget.dart';
import 'package:portfolio/view/widgets/outlinedButtonWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final double height, width;
  final bool isDesktop, isPhone, isTablet;
  final DataModel dataModel;
  final ValueChanged<int>? onItemTapped;

  const HomeScreen({
    Key? key,
    this.height = 1,
    this.width = 1,
    this.isDesktop = false,
    required this.dataModel,
    this.onItemTapped,
    this.isPhone = false,
    this.isTablet = false,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  int flex = 1;
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    valueApp = ValueApp(
        size: size,
        isPhone: widget.isPhone,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet);
    return widget.isDesktop ? desktopDesplay() : notDesktopDesplay();
  }

  Widget desktopDesplay() => Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: body(),
              ),
              Container(
                height: size.height * 0.1,
                color: ColorApp().DarkColor,
              ),
            ],
          )
        ],
      );

  Widget notDesktopDesplay() => Column(
        children: [
          imageBody(),
          textBody(),
        ],
      );

  List<Widget> body() => [
        Expanded(
          flex: flex,
          child: textBody(),
        ),
        Expanded(
          flex: 1,
          child: imageBody(),
        ),
      ];

  Widget imageBody() => Center(
        child: ImageWidget(
          pathAssets: "assets/images/my_image.png",
          height: widget.height,
          width: widget.width,
          circleColor: ColorApp().PrimaryColor,
          backgroundColor: ColorApp().SecondaryColor,
        ),
      );

  Widget textBody() => Wrap(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              generatText(
                text: AppLocalizations.of(context)!.helloIAm,
                fontSize: valueApp.getTitleSizeH1(),
                textColor: ColorApp().whiteColor,
              ),
              generatText(
                text: widget.dataModel.fullName,
                fontSize: valueApp.getTitleSizeH0(),
                textColor: ColorApp().whiteColor,
              ),
              generatText(
                text: widget.dataModel.descriptionMe,
                fontSize: valueApp.getSubtitleSizeH1(),
                textColor: ColorApp().whiteColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: valueApp.getPaddingSize(16.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButtonWidget(
                      backgroundColor: ColorApp().PrimaryColor,
                      textColor: ColorApp().whiteColor,
                      iconSize: valueApp.getButtonSize(),
                      icon: Icons.person,
                      textSize: valueApp.getButtonSize(),
                      text: AppLocalizations.of(context)!.aboutMe,
                      onPressed: () {
                        widget.onItemTapped!(1);
                      },
                    ),
                    OutlinedButtonWidget(
                      backgroundColor: ColorApp().transparent,
                      textColor: ColorApp().whiteColor,
                      borderColor: ColorApp().PrimaryColor,
                      borderWidth: 1,
                      iconSize: valueApp.getButtonSize(),
                      icon: Icons.remove_red_eye,
                      textSize: valueApp.getButtonSize(),
                      text: AppLocalizations.of(context)!.projects,
                      onPressed: () {
                        widget.onItemTapped!(2);
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );

  Widget generatText({
    required String text,
    double fontSize = 14.0,
    required Color textColor,
  }) =>
      Padding(
        padding: EdgeInsets.all(valueApp.getPaddingSize(2.0)),
        child: Container(
          width: size.width * 0.5,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      );
}
