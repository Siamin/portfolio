import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomePhoneScreen extends StatelessWidget {
  final DataModel dataModel;

  const HomePhoneScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      appBar: AppBar(
        backgroundColor: ColorApp().DarkColor,
        title: Text(
          "Amin Syahi",
          style: TextStyle(
              color: ColorApp().PrimaryColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: HomeScreen(
          height: 200,
          width: 200,
        ),
      ),
      drawer: MenuWidget(isPhone: true,),
    );
  }
}