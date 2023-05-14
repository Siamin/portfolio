import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/widgets/ImageWidget.dart';
import 'package:portfolio/view/widgets/outlinedButtonWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final double height, width;
  final bool isDesktop;
  final DataModel dataModel;
  final ValueChanged<int>? onItemTapped;

  const HomeScreen({
    Key? key,
    required this.height,
    required this.width,
    this.isDesktop = false,
    required this.dataModel,
    this.onItemTapped,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;
  int flex = 1;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

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
                fontSize: size.width * 0.04,
                textColor: ColorApp().whiteColor,
              ),
              generatText(
                text: widget.dataModel.fullName,
                fontSize: size.width * 0.08,
                textColor: ColorApp().whiteColor,
              ),
              generatText(
                text: widget.dataModel.descriptionMe,
                fontSize: size.width * 0.014,
                textColor: ColorApp().whiteColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButtonWidget(
                      backgroundColor: ColorApp().PrimaryColor,
                      textColor: ColorApp().whiteColor,
                      iconSize: size.width * 0.014,
                      icon: Icons.person,
                      textSize: size.width * 0.014,
                      text: AppLocalizations.of(context)!.aboutMe,
                      onPressed: () {
                        print("Pressed");
                        widget.onItemTapped!(1);
                      },
                    ),
                    OutlinedButtonWidget(
                      backgroundColor: ColorApp().transparent,
                      textColor: ColorApp().whiteColor,
                      borderColor: ColorApp().PrimaryColor,
                      borderWidth: 1,
                      iconSize: size.width * 0.014,
                      icon: Icons.remove_red_eye,
                      textSize: size.width * 0.014,
                      text: AppLocalizations.of(context)!.projects,
                      onPressed: () {
                        print("Pressed");
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
        padding: EdgeInsets.all((size.width + size.height) * 0.004),
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
