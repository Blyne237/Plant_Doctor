import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/components/page_title_bar.dart';
import 'package:flutter_application_blyne_1/components/under_part.dart';
import 'package:flutter_application_blyne_1/components/upside.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_button.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_input_field.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_password_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                  imgUrl: "assets/images/register.png",
                ),
                const PageTitleBar(title: 'Welcome'),
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
                        const SizedBox(
                          height: 10,
                        ),
                        // iconButton(context),
                        // const SizedBox(
                        //   height: 20,
                        // ),
                        const Text(
                          "Create your account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                         const SizedBox(
                          height: 50,
                        ),
                        Form(
                          child: Column(
                            children: [
                              const RoundedInputField(
                                  hintText: "Email", icon: Icons.email),
                              const RoundedInputField(
                                  hintText: "Name", icon: Icons.person),
                              const RoundedPasswordField(),
                              RoundedButton(text: 'REGISTER', press: () {}),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => const SignIn())
                                  );
                                },
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

