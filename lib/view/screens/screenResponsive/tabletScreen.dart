import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/aboutMeScreen.dart';
import 'package:portfolio/view/screens/connectScreen.dart';
import 'package:portfolio/view/screens/footerScreen.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/screens/projectsScreen.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomeTabletScreen extends StatefulWidget {
  final DataModel dataModel;

  const HomeTabletScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<HomeTabletScreen> createState() => _HomeTabletScreenState();
}

class _HomeTabletScreenState extends State<HomeTabletScreen> {
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
              dataModel: widget.dataModel,
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                HomeScreen(
                  height: 250,
                  width: 250,
                  dataModel: widget.dataModel,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AboutMeScreen(
                    isTablet: true,
                    dataModel: widget.dataModel,
                  ),
                ),
                ProjectsScreen(
                  isTablet: true,
                  projectModel: widget.dataModel.featured,
                ),
                ConnectScreen(
                  isTablet: true,
                  socialMediaModel: widget.dataModel.socialMedia,
                ),
                FooterScreen(
                  isTablet: true,
                  socialMediaModel: widget.dataModel.socialMedia,
                  footerSkill: widget.dataModel.footerLinks,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
