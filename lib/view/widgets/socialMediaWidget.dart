import 'package:flutter/material.dart';
import 'package:portfolio/models/socialmediaModel.dart';

class SocialMediaWidget extends StatefulWidget {
  final SocialMediaModel model;
  final Alignment alignment;
  final bool isDesktop;

  const SocialMediaWidget(
      {Key? key, required this.model, this.alignment = Alignment.centerLeft, this.isDesktop=false})
      : super(key: key);

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: widget.alignment,
      child: Container(
        width: size.width * 0.13,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.model.isFacebook())
              generateImage(link: widget.model.getIconFacebook()),
            if (widget.model.isInstagram())
              generateImage(link: widget.model.getIconInstagram()),
            if (widget.model.isLinkedin())
              generateImage(link: widget.model.getIconLinkedin()),
            if (widget.model.isMail())
              generateImage(link: widget.model.getIconMail()),
          ],
        ),
      ),
    );
  }

  Widget generateImage({required String link}) => Image.asset(
        link,
        height: widget.isDesktop?30:16,
        width: widget.isDesktop?30:16,
      );
}
