import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/widgets/languageWidget.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

import '../aboutMeScreen.dart';
import '../connectScreen.dart';
import '../projectsScreen.dart';

class HomePhoneScreen extends StatefulWidget {
  final DataModel dataModel;

  const HomePhoneScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<HomePhoneScreen> createState() => _HomePhoneScreenState();
}

class _HomePhoneScreenState extends State<HomePhoneScreen> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectedIndex = controller.page!.toInt();
      });
    });
  }

  _gotPageByIndex(int indexPage){
    controller.animateToPage(indexPage, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      appBar: AppBar(
        backgroundColor: ColorApp().DarkColor,
        actions: const [LanguageWidget(isPhone: true,)],
        title: Text(
          widget.dataModel.fullName,
          style: TextStyle(
              color: ColorApp().PrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          HomeScreen(
            height: 150,
            width: 150,
            isPhone: true,
            dataModel: widget.dataModel,
            onItemTapped: (indexPage){
              _gotPageByIndex(indexPage);
              setState(() {
                selectedIndex = indexPage;
              });
            },
          ),
          AboutMeScreen(
            isPhone: true,
            dataModel: widget.dataModel,
          ),
          ProjectsScreen(
            isPhone: true,
            projectModel: widget.dataModel.featured,
          ),
          ListView(
            children: [
              ConnectScreen(
                isPhone: true,
                socialMediaModel: widget.dataModel.socialMedia,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MenuWidget(
        isPhone: true,
        selectedIndex: selectedIndex,
        dataModel: widget.dataModel,
        onItemTapped: (indexPage) {
          _gotPageByIndex(indexPage);
          setState(() {
            selectedIndex = indexPage;
          });
        },
      ),
    );
  }
}
