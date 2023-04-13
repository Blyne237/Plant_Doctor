import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:flutter_application_blyne_1/page/profile/profile_page.dart';

import 'analyse/analyse_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const Analyse()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/People taking care of plants.gif"),),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
             Text(
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
              CircularProgressIndicator(
                color: kPrimaryColor,
                backgroundColor: Color.fromARGB(70, 235, 234, 234),
              )
            ],
          ),
        ),
      ),
    );
  }
}
