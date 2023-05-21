import 'package:flutter/material.dart';
import 'package:portfolio/colorApp.dart';
import 'package:portfolio/controllers/SharePreferencesController.dart';
import 'package:portfolio/models/socialmediaModel.dart';
import 'package:portfolio/valueApp.dart';
import 'package:portfolio/view/widgets/buttonWidget.dart';
import 'package:portfolio/view/widgets/socialMediaWidget.dart';
import 'package:portfolio/view/widgets/textWidget.dart';
import 'package:portfolio/view/widgets/textfieldWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  late ValueApp valueApp;
  SharePreferencesController spController = SharePreferencesController();
  Alignment alignmentSendButton = Alignment.center;

  @override
  void initState() {
    super.initState();
    spController.getLanguage().then((lang) {
      setState(() {
        if (widget.isDesktop)
          alignmentSendButton = (lang == "fa" ? Alignment.centerRight : Alignment.centerLeft);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    valueApp = ValueApp(
        size: MediaQuery.of(context).size,
        isDesktop: widget.isDesktop,
        isTablet: widget.isTablet,
        isPhone: widget.isPhone);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: valueApp.getPaddingSize(0.5)),
      child: Container(
        alignment: Alignment.center,
        width: valueApp.size.width * (widget.isTablet ? 0.75 : 1),
        height: valueApp.size.height * (widget.isPhone ? 1 : 0.75),
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
            padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
            child: TextWidget(
              text: AppLocalizations.of(context)!.connectTitle,
              textColor: ColorApp().PrimaryColor,
              fontSize: valueApp.getTitleSizeH1(),
              textAlign: widget.isDesktop ? TextAlign.start : TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
            child: TextWidget(
              text: AppLocalizations.of(context)!.connectDescription,
              textColor: ColorApp().whiteColor,
              fontSize: valueApp.getSubtitleSizeH2(),
              textAlign: widget.isDesktop ? TextAlign.start : TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
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
                  padding: EdgeInsets.all(valueApp.getPaddingSize(12)),
                  child: TextWidget(
                    text: AppLocalizations.of(context)!.connectTitleForm,
                    textColor: ColorApp().whiteColor,
                    fontSize: valueApp.getSubtitleSizeH2(),
                    textAlign:
                        widget.isDesktop ? TextAlign.start : TextAlign.center,
                  ),
                ),
                TextFieldWidget(
                  labelText: AppLocalizations.of(context)!.name,
                  width: valueApp.getTextFieldSize(),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                TextFieldWidget(
                  labelText: AppLocalizations.of(context)!.email,
                  width: valueApp.getTextFieldSize(),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                TextFieldWidget(
                  labelText: AppLocalizations.of(context)!.message,
                  maxLines: 4,
                  width: valueApp.getTextFieldSize(),
                  alignment: widget.isDesktop
                      ? Alignment.centerLeft
                      : Alignment.center,
                ),
                Align(
                  alignment: alignmentSendButton,
                  child: Padding(
                    padding: EdgeInsets.all(valueApp.getPaddingSize(8)),
                    child: ButtonWidget(
                      backgroundColor: ColorApp().PrimaryColor,
                      textColor: ColorApp().whiteColor,
                      textSize: 14,
                      text: AppLocalizations.of(context)!.send,
                      onPressed: () {
                        //send message for me
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
