import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/skillModel.dart';

class SkillWidget extends StatefulWidget {
  final bool isTablet;
  final List<SkillModel> skillModel;

  const SkillWidget({Key? key, this.isTablet = false, required this.skillModel})
      : super(key: key);

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  late Size size;
  late double sumScreen;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: widget.skillModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            skillbody(model: widget.skillModel[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
      ),
    );
  }

  Widget skillbody({required SkillModel model}) => Padding(
        padding: EdgeInsets.all(sumScreen * 0.005),
        child: Container(
          height: sumScreen * 0.11,
          width: sumScreen * 0.11,
          color: ColorApp().PrimaryColor,
          child: Padding(
            padding: EdgeInsets.all(sumScreen * 0.008),
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
                        height: sumScreen * 0.02,
                        width: sumScreen * 0.02,
                      ),
                      Text(
                        model.title,
                        style: TextStyle(
                            color: ColorApp().whiteColor,
                            fontSize: sumScreen * 0.008),
                      ),
                      Text(
                        model.subTitle,
                        style: TextStyle(
                            color: ColorApp().whiteColor,
                            fontSize: sumScreen * 0.008),
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
