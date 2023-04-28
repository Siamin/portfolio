import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/serviceModel.dart';

class ServiceWidget extends StatefulWidget {
  final bool isTablet;
  final bool isDesktop;
  final List<ServiceModel> serviceModel;

  const ServiceWidget(
      {Key? key,
      this.isTablet = false,
      this.isDesktop = false,
      required this.serviceModel})
      : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  late double sumScreen;
  late int divisionColum = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    divisionColum = widget.isDesktop ? 3 : 2;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: widget.serviceModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            serviceBody(model: widget.serviceModel[index], number: index + 1),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
      ),
    );
  }

  Widget serviceBody({required ServiceModel model, required int number}) =>
      Padding(
        padding: EdgeInsets.all(sumScreen * 0.002),
        child: Card(
          color: ColorApp().transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: model.getBorderColor(number: number), width: 2.5),
            borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
          ),
          child: Container(
            height: sumScreen * 0.15,
            width: sumScreen * 0.15,
            child: Padding(
              padding: EdgeInsets.all(sumScreen * 0.008),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(sumScreen * 0.004),
                    child: Image.asset(
                      model.getPath(),
                      height: sumScreen * 0.025,
                      width: sumScreen * 0.025,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sumScreen * 0.006),
                    child: Text(
                      model.title,
                      style: TextStyle(
                          color: model.getTitleColor(number: number), fontSize: sumScreen * 0.01),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(sumScreen * 0.006),
                    child: Text(
                      model.description,
                      style: TextStyle(
                          color: ColorApp().whiteColor,
                          fontSize: sumScreen * 0.008),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
