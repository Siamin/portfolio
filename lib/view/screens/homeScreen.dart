import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/view/widgets/ImageWidget.dart';

class HomeScreen extends StatefulWidget {
  final double height, width;
  final bool isDesktop;

  const HomeScreen({
    Key? key,
    required this.height,
    required this.width,
    this.isDesktop = false,
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
    children: [Column(
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
        )],
  );

  Widget notDesktopDesplay() => ListView(
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
                text: "Hello, i’m",
                fontSize: size.width * 0.04,
                textColor: ColorApp().whiteColor,
                width: size.width,
              ),
              generatText(
                text: "Amin Syahi",
                fontSize: size.width * 0.08,
                textColor: ColorApp().whiteColor,
                width: size.width,
              ),
              generatText(
                text:
                    "Freelance UI designer, Fullstack developer, & Data Miner. I create seamless web experiences for end-users.",
                fontSize: size.width * 0.014,
                textColor: ColorApp().whiteColor,
                width: size.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      label: Text(
                        'About me',
                        style: TextStyle(
                          fontSize: size.width * 0.014,
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        // <-- Icon
                        Icons.person,
                        size: size.width * 0.014,
                      ),
                      // <-- Text
                    ),
                    OutlinedButton.icon(
                      // <-- OutlinedButton
                      style: OutlinedButton.styleFrom(
                        backgroundColor: ColorApp().transparent,
                        primary: ColorApp().whiteColor,
                        side: BorderSide(
                          color: ColorApp().PrimaryColor,
                          width: 1,
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: size.width * 0.014,
                      ),
                      label: Text(
                        'Projects',
                        style: TextStyle(
                          fontSize: size.width * 0.014,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );

  Widget generatText(
          {required String text,
          double fontSize = 14.0,
          required Color textColor,
          double? width}) =>
      Padding(
        padding: EdgeInsets.all((size.width+size.height)*0.004),
        child: Container(
          width: width! * 0.5,
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
