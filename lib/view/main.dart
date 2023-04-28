import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/controllers/jsonController.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/screenResponsive/desktopScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/phoneScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/tabletScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/unDefindScreen.dart';
import 'package:portfolio/view/widgets/loadingWidget.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: ColorApp().materialApp(),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataModel dataModel;

  Future<void> getData() async {
    dataModel =
        await JsonController().readDataJson(fileName: "dataPortfolioEnglish");

    return;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingWidget(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          );
        } else if (snapshot.hasError) {
          return const UndefinedScreen();
        } else {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.watch) {
                return const UndefinedScreen();
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return HomeDesktopScreen(
                  dataModel: dataModel,
                );
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.tablet) {
                return HomeTabletScreen(
                  dataModel: dataModel,
                );
              }

              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.mobile) {
                return HomePhoneScreen(
                  dataModel: dataModel,
                );
              }

              return const UndefinedScreen();
            },
          );
        }
      },
    );
  }
}
