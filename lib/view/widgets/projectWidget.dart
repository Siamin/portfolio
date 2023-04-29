import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/projectModel.dart';
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
  late double sumScreen;
  late int divisionColum = 2;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.2 : size.width));
    divisionColum = widget.isDesktop ? 3 : 2;

    return Padding(
      padding: const EdgeInsets.all(16.0),
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
        padding: EdgeInsets.all(sumScreen * 0.002),
        child: Card(
          color: ColorApp().GaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular((18.0)), //<-- SEE HERE
          ),
          child: Padding(
            padding: EdgeInsets.all(sumScreen * 0.005),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: ColorApp().PrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular((10.0)), //<-- SEE HERE
                  ),
                  child: Image.asset(
                    model.getPath(0),
                    height: size.width * 0.14,
                    width: (widget.isTablet ? size.width * 0.75 : size.width) *
                        0.75,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: ColorApp().PrimaryColor,
                      fontSize: size.width * 0.025,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    model.subTitle,
                    style: TextStyle(
                      color: ColorApp().whiteColor,
                      fontSize: size.width * 0.012,
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
          padding: const EdgeInsets.all(3.0),
          child: ButtonWidget(
            backgroundColor: ColorApp().PrimaryColor,
            textColor: ColorApp().whiteColor,
            textSize: size.width * 0.014,
            text: AppLocalizations.of(context)!.viewLive,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ButtonWidget(
            backgroundColor: ColorApp().transparent,
            textColor: ColorApp().whiteColor,
            textSize: size.width * 0.014,
            text: AppLocalizations.of(context)!.githubRepo,
            borderWidth: 1,
            borderColor: ColorApp().PrimaryColor,
          ),
        ),
      ];
}
