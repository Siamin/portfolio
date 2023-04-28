import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/socialmediaModel.dart';
import 'package:portfolio/view/widgets/buttonWidget.dart';
import 'package:portfolio/view/widgets/socialMediaWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:portfolio/view/widgets/textfieldWidget.dart';

class ConnectScreen extends StatefulWidget {
  final bool isPhone, isTablet, isDesktop;

  const ConnectScreen({
    Key? key,
    this.isPhone = false,
    this.isTablet = false,
    this.isDesktop = false,
  }) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  late Size size;
  late double sumScreen;
  SocialMediaModel socialMediaModel = SocialMediaModel(
      facebook: "@facebook",
      linkedin: "@linkdin",
      instagram: "instagram",
      mail: "amin@gmail.com");

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    return Container(
      width: size.width * (widget.isTablet ? 0.75 : 1),
      height: size.height * (widget.isPhone ? 1 : 0.8),
      child: widget.isDesktop ? getRowScreen() : getColumnScreen(),
    );
  }

  getRowScreen() => Row(
        children: [
          Expanded(flex: 1, child: getFirst()),
          getSendMessage(),
        ],
      );

  getColumnScreen() => Column(
        children: [
          getFirst(),
          getSendMessage(),
        ],
      );

  Widget getFirst() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(
              text: "Connect with me:",
              textColor: ColorApp().PrimaryColor,
              fontSize: sumScreen * 0.02,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(
              text: "Satisfied with me? Please contact me",
              textColor: ColorApp().whiteColor,
              fontSize: sumScreen * 0.0085,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SocialMediaWidget(model: socialMediaModel,isDesktop: widget.isDesktop,),
          ),
        ],
      );

  Widget getSendMessage() => Expanded(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextWidget(
                text: "Contact me, let’s make magic together",
                textColor: ColorApp().whiteColor,
                fontSize: sumScreen * 0.0085,
              ),
            ),
            TextFieldWidget(
              labelText: "Name",
              width: size.width * 0.3,
            ),
            TextFieldWidget(
              labelText: "Email",
              width: size.width * 0.3,
            ),
            TextFieldWidget(
              labelText: "Message",
              maxLines: 4,
              width: size.width * 0.3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonWidget(
                  backgroundColor: ColorApp().PrimaryColor,
                  textColor: ColorApp().whiteColor,
                  textSize: 14,
                  text: "Send",
                ),
              ),
            ),
          ],
        ),
      );
}
