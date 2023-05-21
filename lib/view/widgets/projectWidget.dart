import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/projectModel.dart';
import 'package:portfolio/valueApp.dart';
import 'package:portfolio/view/widgets/buttonWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectWidget extends StatefulWidget {
  final bool isTablet;
  final bool isDesktop;
  final bool isPhone;
  final List<ProjectModel> projectModels;

  const ProjectWidget({
    Key? key,
    this.isTablet = false,
    this.isDesktop = false,
    required this.projectModels,
    this.isPhone = false,
  }) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  late int divisionColum = 2;
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    valueApp = ValueApp(
        size: size,
        isPhone: widget.isPhone,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet);
    divisionColum = widget.isDesktop ? 3 : 2;

    return Padding(
      padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
      child: GridView.builder(
        itemCount: widget.projectModels.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            projectBody(model: widget.projectModels[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: divisionColum,
        ),
      ),
    );
  }

  Widget projectBody({required ProjectModel model}) => Padding(
        padding: EdgeInsets.all(valueApp.getPaddingSize(0.09)),
        child: Card(
          color: ColorApp().GaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(valueApp.getPaddingSize(3)),
          ),
          child: Padding(
            padding: EdgeInsets.all(valueApp.getPaddingSize(2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorApp().PrimaryColor, width: 2),
                    borderRadius:
                        BorderRadius.circular(valueApp.getPaddingSize(1)),
                  ),
                  child: Image.asset(
                    model.getPath(0),
                    height: valueApp.getImageSize(widget.isDesktop
                        ? 25
                        : widget.isTablet
                            ? 70
                            : 40),
                    width: valueApp.getImageSize(160),
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valueApp.getPaddingSize(2)),
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: ColorApp().PrimaryColor,
                      fontSize: valueApp.getTitleSizeH2(),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(valueApp.getPaddingSize(0.08)),
                  child: Text( model.subTitle,
                    style: TextStyle(
                      color: ColorApp().whiteColor,
                      fontSize: valueApp.getSubtitleSizeH3(),
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: getButtonBody(model),
                ),
              ],
            ),
          ),
        ),
      );

  getButtonBody(ProjectModel model) => [
        Padding(
          padding: EdgeInsets.all(valueApp.getPaddingSize(0.009)),
          child: ButtonWidget(
            backgroundColor: ColorApp().PrimaryColor,
            textColor: ColorApp().whiteColor,
            textSize: valueApp.getButtonSize(),
            text: AppLocalizations.of(context)!.viewLive,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(valueApp.getPaddingSize(0.009)),
          child: ButtonWidget(
            backgroundColor: ColorApp().transparent,
            textColor: ColorApp().whiteColor,
            textSize: valueApp.getButtonSize(),
            text: AppLocalizations.of(context)!.githubRepo,
            borderWidth: 1,
            borderColor: ColorApp().PrimaryColor,
          ),
        ),
      ];
}
