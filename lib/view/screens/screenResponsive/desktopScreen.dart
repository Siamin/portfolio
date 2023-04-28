import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/aboutMeScreen.dart';
import 'package:portfolio/view/screens/connectScreen.dart';
import 'package:portfolio/view/screens/footerScreen.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/screens/projectsScreen.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomeDesktopScreen extends StatefulWidget {
  final DataModel dataModel;
  const HomeDesktopScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<HomeDesktopScreen> createState() => _HomeDesktopScreenState();
}

class _HomeDesktopScreenState extends State<HomeDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      body: Column(
        children: [
          MenuWidget(
            isDesktop: true,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                HomeScreen(
                  isDesktop: true,
                  height: size.height * 0.6,
                  width: size.width * 0.6,
                ),
                AboutMeScreen(
                  isDesktop: true,
                ),
                ProjectsScreen(
                  isDesktop: true,
                ),
                ConnectScreen(
                  isDesktop: true,
                ),
                FooterScreen(
                  isDesktop: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
