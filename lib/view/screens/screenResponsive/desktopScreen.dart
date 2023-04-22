import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomeDesktopScreen extends StatefulWidget {
  const HomeDesktopScreen({Key? key}) : super(key: key);

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
          MenuWidget(isDesktop: true,),
          Expanded(
            flex: 1,
            child: HomeScreen(
              isDesktop: true,
              height: size.height*0.6,
              width: size.width*0.6,
            ),
          ),
        ],
      ),
    );
  }
}
