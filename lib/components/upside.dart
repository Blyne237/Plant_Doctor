import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 2,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              imgUrl,
              alignment: Alignment.topCenter,
              scale: 8,
            ),
          ),
        ),
        iconBackButton(context),
        Positioned(
          left: 0,
          top: 175,
          child: Image.asset(
            "assets/images/upside1.png",
            scale: 3,
          ),
        ),
        Positioned(
          right: 0,
          top: 60,
          child: Image.asset(
            "assets/images/upside2.png",
            scale: 3,
          ),
        ),
      ],
    );
  }
}

iconBackButton(BuildContext context) {
  return IconButton(
    color: Colors.white,
    iconSize: 28,
    icon: const Icon(CupertinoIcons.arrow_left),
    onPressed: (){
      Navigator.pop(context);
    },
  );
}
