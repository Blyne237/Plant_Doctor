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
                        const Text(
                          "The Plant Doctor",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'Inter',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: 1,
                          ),
                        ),
                        Image.asset('assets/images/plant_doctor.png',
                            width: 150, alignment: Alignment.center),
                        
                        const Padding(
                          padding: EdgeInsets.all(50.0),
                          child: Text(
                            "\t\t\t\t\t\tUsers of The Plant Doctor app include: Farmers, gardeners, homeowners, landscape professionals, County Agents, plant quarantine workers, professionals, and scientists.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UnderPart(
                            title: "Copyright here",
                            navigatorText: "Back",
                            onTap: () => Navigator.of(context).pop()),
                        const SizedBox(
                          height: 20,
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
