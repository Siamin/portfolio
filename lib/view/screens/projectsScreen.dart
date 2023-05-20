import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/valueApp.dart';
import 'package:portfolio/view/widgets/projectWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectsScreen extends StatefulWidget {
  final bool isPhone, isTablet, isDesktop;
  final List<ProjectModel> projectModel;

  const ProjectsScreen({
    Key? key,
    this.isPhone = false,
    this.isTablet = false,
    this.isDesktop = false,
    required this.projectModel,
  }) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late double sumScreen;
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    valueApp = ValueApp(
        size: size,
        isPhone: widget.isPhone,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet);

    return Container(
      width: size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: valueApp.getPaddingSize(widget.isPhone ? 4 : 16)),
        child: widget.isPhone ? getPhoneBody() : otherBody(),
      ),
    );
  }

  getPhoneBody() => ListView(
        children: [
          otherBody(),
        ],
      );

  otherBody() => Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: valueApp.getPaddingSize(4)),
            child: TextWidget(
              text: AppLocalizations.of(context)!.projectTitle,
              textColor: ColorApp().PrimaryColor,
              fontSize: valueApp.getTitleSizeH1(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: valueApp.getPaddingSize(4),
              vertical: valueApp.getPaddingSize(8),
            ),
            child: TextWidget(
              text: AppLocalizations.of(context)!.projectDescription,
              textColor: ColorApp().whiteColor,
              fontSize: valueApp.getSubtitleSizeH2(),
            ),
          ),
          ProjectWidget(
            projectModels: widget.projectModel,
            isDesktop: widget.isDesktop,
            isTablet: widget.isTablet,
            isPhone: widget.isPhone,
          )
        ],
      );
}
