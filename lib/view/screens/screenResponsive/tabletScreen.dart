import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/view/screens/aboutMeScreen.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/screens/projectsScreen.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomeTabletScreen extends StatelessWidget {
  const HomeTabletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: MenuWidget(
              isTablet: true,
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                HomeScreen(
                  height: 250,
                  width: 250,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AboutMeScreen(
                    isTablet: true,
                  ),
                ),
                ProjectsScreen(
                  isTablet: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
