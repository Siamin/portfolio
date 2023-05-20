import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/skillModel.dart';
import 'package:portfolio/valueApp.dart';

class SkillWidget extends StatefulWidget {
  final bool isTablet, isPhone, isDesktop;
  final List<SkillModel> skillModel;

  const SkillWidget({
    Key? key,
    this.isTablet = false,
    required this.skillModel,
    this.isPhone = false,
    this.isDesktop = false,
  }) : super(key: key);

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  late Size size;
  late ValueApp valueApp;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    valueApp = ValueApp(
        size: size,
        isPhone: widget.isPhone,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet);

    return Padding(
      padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
      child: GridView.builder(
        itemCount: widget.skillModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            skillbody(model: widget.skillModel[index]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
      ),
    );
  }

  Widget skillbody({required SkillModel model}) => Padding(
        padding: EdgeInsets.all(valueApp.getPaddingSize(2.5)),
        child: Container(
          height: valueApp.getBoxSize(),
          width: valueApp.getBoxSize(),
          color: ColorApp().PrimaryColor,
          child: Padding(
            padding: EdgeInsets.all(valueApp.getPaddingSize(1.5)),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        model.getPath(),
                        height: valueApp.getImageSize(15),
                        width: valueApp.getImageSize(15),
                      ),
                      Text(
                        model.title,
                        style: TextStyle(
                          color: ColorApp().whiteColor,
                          fontSize: valueApp.getTitleSizeH2(),
                        ),
                      ),
                      Text(
                        model.subTitle,
                        style: TextStyle(
                          color: ColorApp().whiteColor,
                          fontSize: valueApp.getSubtitleSizeH3(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
