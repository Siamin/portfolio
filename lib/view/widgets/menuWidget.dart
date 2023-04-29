import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/main.dart';

class MenuWidget extends StatefulWidget {
  final bool isDesktop, isTablet, isPhone;
  final DataModel dataModel;

  const MenuWidget({
    Key? key,
    this.isDesktop = false,
    this.isTablet = false,
    this.isPhone = false,
    required this.dataModel,
  }) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late double width;
  int flex = 1;
  late Size size;
  bool statusLang = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = widget.isDesktop ? size.width : 0;
    flex = widget.isDesktop ? 1 : 3;
    if (widget.isDesktop) {
      return desktopMenu();
    } else if (widget.isTablet) {
      return tabletMenu();
    } else if (widget.isPhone) {
      return phoneMenu();
    } else
      return Container();
  }

  Widget desktopMenu() => Container(
        color: ColorApp().DarkColor,
        height: size.height * 0.06,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: menuBody(),
        ),
      );

  Widget tabletMenu() => Container(
        color: ColorApp().DarkColor,
        child: Column(
          children: menuBody(),
        ),
      );

  Widget phoneMenu() => Drawer(
        backgroundColor: ColorApp().DarkColor,
        child: tabletMenu(),
      );

  List<Widget> menuBody() => [
        Expanded(
          flex: 1,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: ((width / 2) * 0.3)),
              child: Text(
                widget.dataModel.fullName,
                style: TextStyle(
                    color: ColorApp().PrimaryColor,
                    fontSize: widget.isTablet ? 16 : 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: flex,
          child: widget.isDesktop ? menuDesktopItems() : menuTabletItems(),
        ),
      ];

  Widget menuDesktopItems() => Padding(
        padding: EdgeInsets.symmetric(horizontal: (width / 2) * 0.22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: menuItems(),
        ),
      );

  Widget menuTabletItems() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: menuItems(),
      );

  List<Widget> menuItems() => [
        Text(
          AppLocalizations.of(context)!.home,
          style: TextStyle(color: ColorApp().PrimaryColor),
        ),
        Text(
          AppLocalizations.of(context)!.aboutMe,
          style: TextStyle(color: ColorApp().whiteColor),
        ),
        Text(
          AppLocalizations.of(context)!.projects,
          style: TextStyle(color: ColorApp().whiteColor),
        ),
        Text(
          AppLocalizations.of(context)!.contact,
          style: TextStyle(color: ColorApp().whiteColor),
        ),
        Switch(
          value: statusLang,
          onChanged: (status) {
            print("status ${status}");
            setState(() {
              statusLang = !statusLang;
            });
            if(status)
              MyApp.setLocal(context, Locale("fa"));
            else
              MyApp.setLocal(context, Locale("en"));
          },
        ),
      ];
}
