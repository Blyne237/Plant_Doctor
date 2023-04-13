import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/widgets/text_field_container.dart';


class RoundedPasswordField extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  final bool obscure;
  final String placeholder;
  final Icon? prefixIcon;
  final Icon? suffixIcon;

  const RoundedPasswordField(
      {Key? key,
      required this.myController,
      this.hintText,
      this.isPassword,
      required this.placeholder,
      required this.prefixIcon,
      required this.obscure,
      required this.suffixIcon})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        controller: widget.myController,
        obscureText: widget.obscure ? !visible : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: kPrimaryLightColor,
          hintText: widget.placeholder,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscure
              ? IconButton(
                  splashColor: kPrimaryColor,
                  highlightColor: kPrimaryColor,
                  icon: visible
                      ? Image.asset("assets/icons/eye-close.png",
                          height: 25, width: 25, color: kPrimaryColor)
                      : Image.asset("assets/icons/eye-open.png",
                          height: 25, width: 25, color: kPrimaryColor),
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                )
              : widget.suffixIcon,
        )),
    );
  }
}

