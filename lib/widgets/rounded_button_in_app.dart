import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';

class RoundedButtonInApp extends StatelessWidget {
  const RoundedButtonInApp(
      {Key? key, this.press, this.textColor = Colors.white, required this.text})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.38,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor,fontSize: 12),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
        textStyle: TextStyle(
          letterSpacing: 2,
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans'
        )
      ),
    );
  }


}
