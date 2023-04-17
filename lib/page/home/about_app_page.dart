import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_screen.dart';
import 'package:flutter_application_blyne_1/page/profile/profile_page.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_button.dart';
import 'package:unicons/unicons.dart';

import '../../components/page_title_bar.dart';
import '../../components/under_part.dart';
import '../../components/upside.dart';
import '../auth/register/register_page.dart';



class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
 

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
                const Upside(
                  imgUrl: "assets/images/About us page-pana.png",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
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
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // iconButton(context),
                        const SizedBox(
                          height: 40,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                          UnderPart(
                                title: "Copyright here",
                                navigatorText: "Back",
                                onTap: () => Navigator.of(context).pop()
                              ),
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
