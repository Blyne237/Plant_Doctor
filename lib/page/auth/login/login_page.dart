import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/components/page_title_bar.dart';
import 'package:flutter_application_blyne_1/components/under_part.dart';
import 'package:flutter_application_blyne_1/components/upside.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/register/register_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_page.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_button.dart';
// import 'package:flutter_application_blyne_1/widgets/rounded_icon.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_input_field.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_password_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  Future<void> _login(context) async {
      
      if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        Fluttertoast.showToast(
        msg: "pleasse fill all the input",
        backgroundColor: Colors.red,
        fontSize: 15.0,
      );
      return;
    }
    setState(() {
      loading = true;
    });
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password:
                    _passwordController.text);
        print("Login");
        Fluttertoast.showToast(
          msg: "Login successful",
          backgroundColor: Colors.green[600],
          timeInSecForIosWeb: 1,
          fontSize: 15.0,
        );

        if (!mounted) return;

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const Home()));
      } on FirebaseAuthException catch (ex) {
        if (ex.code == "user-not-found") {
          print("email id dose not exists");
          Fluttertoast.showToast(
            msg: "Email id dose not exists",
            backgroundColor: Colors.red[400],
            timeInSecForIosWeb: 1,
            fontSize: 15.0,
          );
        } else if (ex.code ==
            "wrong-password") {
          print("Wrong password");
          Fluttertoast.showToast(
            msg: "Wrong password",
            backgroundColor: Colors.red[400],
            timeInSecForIosWeb: 1,
            fontSize: 15.0,
          );
        }
      }
      setState(() {
        loading = false;
      });
    }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: LoadingOverlay(
          isLoading: loading,
          opacity: 0.5,
          progressIndicator: const CircularProgressIndicator(),
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  const Upside(
                    imgUrl: "assets/images/login.png",
                  ),
                  const PageTitleBar(title: 'Welcome Back'),
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
                            height: 10,
                          ),
                          const Text(
                            "Login to your account",
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Form(
                            child: Column(
                              children: [
                                RoundedInputField(
                                  icon: Icons.email,
                                  myController: _emailController, 
                                  placeholder: 'Email', 
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                RoundedPasswordField(
                                  myController: _passwordController,
                                  obscure: true,
                                  placeholder: "Password",
                                  prefixIcon: const Icon(Icons.password),
                                  suffixIcon: null
                                ),
                                // switchListTile(),
                                  
                                RoundedButton(
                                        text: 'LOGIN',
                                        press: () => _login(context),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UnderPart(
                                  title: "Don't have an account?",
                                  navigatorText: "Register here",
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUp()));
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
      ),
    );
  }
}
