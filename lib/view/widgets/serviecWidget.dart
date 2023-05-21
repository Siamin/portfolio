import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/serviceModel.dart';
import 'package:portfolio/valueApp.dart';

class ServiceWidget extends StatefulWidget {
  final bool isPhone, isTablet, isDesktop;
  final List<ServiceModel> serviceModel;

  const ServiceWidget(
      {Key? key,
      this.isTablet = false,
      this.isDesktop = false,
      this.isPhone = false,
      required this.serviceModel})
      : super(key: key);

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
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
    divisionColum = widget.isPhone ? 2 : 3;

    return Padding(
      padding: EdgeInsets.all(valueApp.getPaddingSize(4)),
      child: GridView.builder(
        itemCount: widget.serviceModel.length,
        shrinkWrap: true,
        itemBuilder: (context, index) =>
            serviceBody(model: widget.serviceModel[index], number: index + 1),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: divisionColum,
        ),
      ),
    );
  }

  Widget serviceBody({required ServiceModel model, required int number}) =>
      Wrap(
        children: [
          Padding(
            padding: EdgeInsets.all(valueApp.getPaddingSize(2)),
            child: Card(
              color: ColorApp().transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: model.getBorderColor(number: number,isPhone: widget.isPhone),
                  width: 2.5,
                ),
                borderRadius: BorderRadius.circular(valueApp.getPaddingSize(4)), //<-- SEE HERE
              ),
              child: Container(
                height: valueApp.getBoxSize(),
                width: valueApp.getBoxSize(),
                child: Padding(
                  padding: EdgeInsets.all(valueApp.getPaddingSize(3)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(valueApp.getPaddingSize(3)),
                        child: Image.asset(
                          model.getPath(),
                          height: valueApp.getImageSize(18),
                          width: valueApp.getImageSize(18),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(valueApp.getPaddingSize(4)),
                        child: Text(
                          model.title,
                          style: TextStyle(
                            color: model.getTitleColor(number: number,isPhone: widget.isPhone),
                            fontSize: valueApp.getTitleSizeH3(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          valueApp.getPaddingSize(1.5),
                        ),
                        child: Text(
                          model.description,
                          style: TextStyle(
                              color: ColorApp().whiteColor,
                              fontSize:valueApp.getSubtitleSizeH4()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
