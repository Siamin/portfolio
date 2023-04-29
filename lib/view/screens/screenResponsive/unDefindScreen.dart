import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UndefinedScreen extends StatelessWidget {
  const UndefinedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/error404.png",
                height: size.height * 0.2,
                width: size.width * 0.2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    AppLocalizations.of(context)!.thisScreenUndefined,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.cantShowItemForThisScreenSize,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize:size.width * 0.03,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
