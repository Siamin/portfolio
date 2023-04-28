import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/models/socialmediaModel.dart';
import 'package:portfolio/view/widgets/buttonWidget.dart';
import 'package:portfolio/view/widgets/socialMediaWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:portfolio/view/widgets/textfieldWidget.dart';

class ConnectScreen extends StatefulWidget {
  final bool isPhone, isTablet, isDesktop;
  final SocialMediaModel socialMediaModel;

  const ConnectScreen({
    Key? key,
    this.isPhone = false,
    this.isTablet = false,
    this.isDesktop = false,
    required this.socialMediaModel,
  }) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  late Size size;
  late double sumScreen;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    sumScreen =
        (size.height + (widget.isTablet ? size.width * 0.3 : size.width));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        alignment: Alignment.center,
        width: size.width * (widget.isTablet ? 0.75 : 1),
        height: size.height * (widget.isPhone ? 1 : 0.6),
        child: widget.isDesktop ? getRowScreen() : getColumnScreen(),
      ),
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
              fontSize: sumScreen * (widget.isDesktop ? 0.02 : 0.023),
              textAlign: widget.isDesktop ? TextAlign.start : TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextWidget(
              text: "Satisfied with me? Please contact me",
              textColor: ColorApp().whiteColor,
              fontSize: sumScreen * (widget.isDesktop ? 0.0095 : 0.01),
              textAlign: widget.isDesktop ? TextAlign.start : TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SocialMediaWidget(
              model: widget.socialMediaModel,
              isDesktop: widget.isDesktop,
              alignment:
                  widget.isDesktop ? Alignment.centerLeft : Alignment.center,
            ),
          ),
        ],
      );

  Widget getSendMessage() => Expanded(
        flex: 1,
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextWidget(
                    text: "Contact me, let’s make magic together",
                    textColor: ColorApp().whiteColor,
                    fontSize: sumScreen * (widget.isDesktop ? 0.0095 : 0.01),
                    textAlign:
                        widget.isDesktop ? TextAlign.start : TextAlign.center,
                  ),
                ),
                TextFieldWidget(
                  labelText: "Name",
                  width: size.width * (widget.isDesktop ? 0.3 : 0.5),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                TextFieldWidget(
                  labelText: "Email",
                  width: size.width * (widget.isDesktop ? 0.3 : 0.5),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                TextFieldWidget(
                  labelText: "Message",
                  maxLines: 4,
                  width: size.width * (widget.isDesktop ? 0.3 : 0.5),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                Align(
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonWidget(
                      backgroundColor: ColorApp().PrimaryColor,
                      textColor: ColorApp().whiteColor,
                      textSize: 14,
                      text: "Send",
                      onPressed: () {
                        print("send onpress");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
