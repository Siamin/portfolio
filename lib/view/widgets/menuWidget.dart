import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/models/dataModel.dart';
import 'package:portfolio/view/widgets/languageWidget.dart';

class MenuWidget extends StatefulWidget {
  final bool isDesktop, isTablet, isPhone;
  final DataModel dataModel;
  final ValueChanged<int>? onItemTapped;

  const MenuWidget({
    Key? key,
    this.isDesktop = false,
    this.isTablet = false,
    this.isPhone = false,
    required this.dataModel,
    this.onItemTapped,
  }) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late double width;
  int flex = 1, _selectedIndex = 0;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = widget.isDesktop ? size.width : 0;
    flex = widget.isDesktop ? 2 : 3;
    if (widget.isDesktop) {
      return desktopMenu();
    } else if (widget.isTablet) {
      return tabletMenu();
    } else if (widget.isPhone) {
      return phoneMenu();
    } else
      return Container();
  }

  Widget desktopMenu() => Column(
        children: [
          Container(
            color: ColorApp().DarkColor,
            height: size.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: menuBody(),
            ),
          ),
        ],
      );

  Widget tabletMenu() => Container(
        color: ColorApp().DarkColor,
        child: Column(
          children: menuBody(),
        ),
      );

  Widget phoneMenu() => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: AppLocalizations.of(context)!.aboutMe,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_object),
            label: AppLocalizations.of(context)!.projects,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: AppLocalizations.of(context)!.contact,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorApp().PrimaryColor,
        backgroundColor: ColorApp().DarkColor,
        unselectedItemColor: ColorApp().PrimaryColorLite,
        onTap: (val) {
          widget.onItemTapped!(val);
          setState(() {
            _selectedIndex = val;
          });
        },
      );

  List<Widget> menuBody() => [
        Expanded(
          flex: 1,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: !widget.isDesktop ? LanguageWidget() : Text(""),
              ),
              Center(
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
            ],
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
        TextButton(
          onPressed: () {
            widget.onItemTapped!(0);
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Text(
            AppLocalizations.of(context)!.home,
            style: TextStyle(
                color: _selectedIndex == 0
                    ? ColorApp().PrimaryColor
                    : ColorApp().whiteColor),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onItemTapped!(1);
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Text(
            AppLocalizations.of(context)!.aboutMe,
            style: TextStyle(
                color: _selectedIndex == 1
                    ? ColorApp().PrimaryColor
                    : ColorApp().whiteColor),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onItemTapped!(2);
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Text(
            AppLocalizations.of(context)!.projects,
            style: TextStyle(
                color: _selectedIndex == 2
                    ? ColorApp().PrimaryColor
                    : ColorApp().whiteColor),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onItemTapped!(3);
            setState(() {
              _selectedIndex = 3;
            });
          },
          child: Text(
            AppLocalizations.of(context)!.contact,
            style: TextStyle(
                color: _selectedIndex == 3
                    ? ColorApp().PrimaryColor
                    : ColorApp().whiteColor),
          ),
        ),
        if (widget.isDesktop) LanguageWidget()
      ];
}
