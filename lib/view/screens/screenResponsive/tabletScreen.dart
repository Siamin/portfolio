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
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;
  List<double> offsetIndexPages = [0, 1, 2.5, 3.3];
  double offsetPages = 0.0;
  int selectedIndex=0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= offsetIndexPages[3]*offsetPages) {//Contact
            selectedIndex=3;
          }else if (_scrollController.offset >= offsetIndexPages[2]*offsetPages) {//Projects
            selectedIndex=2;
          }else if (_scrollController.offset >= offsetIndexPages[1]*offsetPages) {//AboutME
            _showBackToTopButton = true;
            selectedIndex=1;
          } else {//HOME
            _showBackToTopButton = false;
            selectedIndex=0;
          }
        });
      });

    super.initState();
  }

  void _scrollToOffset(double offset) {
    _scrollController.animateTo(offset,
        duration: const Duration(seconds: 2), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    offsetPages = ((size.height + size.width) * 0.35);
    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: MenuWidget(
              isTablet: true,
              selectedIndex: selectedIndex,
              dataModel: widget.dataModel,
              onItemTapped: (indexPage) {
                _scrollToOffset(offsetIndexPages[indexPage] * offsetPages);
                setState(() {
                  selectedIndex=indexPage;
                });
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              controller: _scrollController,
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
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: () => _scrollToOffset(0),
              child: const Icon(Icons.arrow_upward),
            ),
    );
  }
}
