import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/controllers/jsonController.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/screens/screenResponsive/desktopScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/phoneScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/tabletScreen.dart';
import 'package:portfolio/view/screens/screenResponsive/unDefindScreen.dart';
import 'package:portfolio/view/widgets/loadingWidget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:const Locale('en'),
      theme: ThemeData(
        primarySwatch: ColorApp().materialApp(),
      ),
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
  });

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late DataModel dataModel;

  Future<void> getData() async {
    dataModel =
        await JsonController().readDataJson(fileName: AppLocalizations.of(context)!.jsonFileName);

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
