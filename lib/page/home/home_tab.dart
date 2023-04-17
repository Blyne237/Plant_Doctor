import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/components/page_title_bar.dart';
import 'package:flutter_application_blyne_1/components/under_part.dart';
import 'package:flutter_application_blyne_1/components/upside.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/register/register_page.dart';
import 'package:flutter_application_blyne_1/page/home/about_app_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_page.dart';
import 'package:flutter_application_blyne_1/page/profile/profile_page.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_button.dart';
// import 'package:flutter_application_blyne_1/widgets/rounded_icon.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_input_field.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_password_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/rounded_button_in_app.dart';

class Daignose extends StatefulWidget {
  const Daignose({super.key});

  @override
  State<Daignose> createState() => _DaignoseState();
}

class _DaignoseState extends State<Daignose> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _settingController = TextEditingController();

  bool loading = false;

  Future<void> _daignose(context) async {
    if (_nameController.text.isEmpty ||
        _symptomsController.text.isEmpty ||
        _settingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "pleasse fill all the input",
        backgroundColor: Colors.red,
        fontSize: 15.0,
      );
      return;
    } else if (_nameController.text.isNotEmpty ||
        _symptomsController.text.isNotEmpty ||
        _settingController.text.isNotEmpty) {
      await Fluttertoast.showToast(
        msg: "Sent successful",
        backgroundColor: Colors.green[600],
        timeInSecForIosWeb: 1,
        fontSize: 15.0,
      );
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Please enter information about your plant",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontFamily: 'OpenSans',
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Form(
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: size.width * 0.8,
                                height: size.height * 0.06,
                                child: const SizedBox(
                                  child: Text(
                                    "One or more of the following: common name, scientific name, veriety",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 132, 132),
                                    ),
                                  ),
                                ),
                              ),
                              RoundedInputField(
                                icon: Icons.email,
                                myController: _nameController,
                                placeholder: 'Plant name',
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: size.width * 0.8,
                                height: size.height * 0.06,
                                child: const SizedBox(
                                  child: Text(
                                    "e.g yellowing, wilting, death, leaf spot, deformity, discoloration, stunting. etc",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 132, 132),
                                    ),
                                  ),
                                ),
                              ),
                              RoundedInputField(
                                icon: Icons.email,
                                myController: _symptomsController,
                                placeholder: "Primary Symptoms",
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: size.width * 0.8,
                                height: size.height * 0.06,
                                child: const SizedBox(
                                  child: Text(
                                    "indoors, landscape, garden, nursery, farm, forest",
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 133, 132, 132),
                                    ),
                                  ),
                                ),
                              ),
                              RoundedInputField(
                                icon: Icons.email,
                                myController: _settingController,
                                placeholder: "Plant Setting",
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundedButtonInApp(
                                      text: 'SUBMIT',
                                      press: () => _daignose(context),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    RoundedButtonInApp(
                                      text: 'ABOUT',
                                      press: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const About(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
