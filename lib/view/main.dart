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

  static void setLocal(BuildContext context, Locale locale) {
    _MatrialState? state = context.findAncestorStateOfType<_MatrialState>();
    state?.setLocal(locale);
  }

  @override
  Widget build(BuildContext context) => Matrial();
}

class Matrial extends StatefulWidget {
  const Matrial({Key? key}) : super(key: key);

  @override
  State<Matrial> createState() => _MatrialState();

}

class _MatrialState extends State<Matrial> {
  Locale? _locale = Locale("fa");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfolio",
      debugShowCheckedModeBanner: true,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: ColorApp().materialApp(),
      ),
      home: const MyPage(),
    );
  }


  void setLocal(Locale locale) => setState(() {
    _locale = locale;
  });
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
    dataModel = await JsonController()
        .readDataJson(fileName: AppLocalizations.of(context)!.jsonFileName);

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
