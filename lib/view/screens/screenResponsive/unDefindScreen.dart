import 'package:flutter/material.dart';

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
                    "This screen undefined",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  Text(
                    "can't show item for this screen size",
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
