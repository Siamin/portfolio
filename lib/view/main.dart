import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/view/screens/screenResponsive/desktopScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/phoneScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/tabletScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/unDefindScreen.dart';
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
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return const UndefinedScreen();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const HomeDesktopScreen();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return const HomeTabletScreen();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return const HomePhoneScreen();
        }

        return const UndefinedScreen();
      },
    );
  }
}
