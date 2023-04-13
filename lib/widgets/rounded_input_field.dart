import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/widgets/text_field_container.dart';

class RoundedInputField extends StatefulWidget {
  final TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  final String placeholder;
  final Icon? prefixIcon;
  
  const RoundedInputField( {
    Key? key, 
    this.hintText,
    required this.myController, 
    this.isPassword,
    required this.placeholder,
    required this.prefixIcon, required this.icon, 
    })
      : super(key: key);
  
  final IconData icon;

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        controller: widget.myController,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            fillColor: kPrimaryLightColor,
            hintText: widget.placeholder,
            prefixIcon: widget.prefixIcon,           
            ),
      ),
    );
  }
}
