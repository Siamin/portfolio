import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/homeScreen.dart';
import 'package:portfolio/view/widgets/languageWidget.dart';
import 'package:portfolio/view/widgets/menuWidget.dart';

class HomePhoneScreen extends StatefulWidget {
  final DataModel dataModel;

  const HomePhoneScreen({Key? key, required this.dataModel}) : super(key: key);

  @override
  State<HomePhoneScreen> createState() => _HomePhoneScreenState();
}

class _HomePhoneScreenState extends State<HomePhoneScreen> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorApp().SecondaryColor,
      appBar: AppBar(
        backgroundColor: ColorApp().DarkColor,
        actions: [
          LanguageWidget()
        ],
        title: Text(
          widget.dataModel.fullName,
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
          dataModel: widget.dataModel,
        ),
      ),
      bottomNavigationBar: MenuWidget(isPhone: true,dataModel: widget.dataModel,onItemTapped: (indexPage){},),
    );
  }
}
