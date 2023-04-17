import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/components/page_title_bar.dart';
import 'package:flutter_application_blyne_1/components/under_part.dart';
import 'package:flutter_application_blyne_1/components/upside.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_button.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_input_field.dart';
import 'package:flutter_application_blyne_1/widgets/rounded_password_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;

  Future<void> _register(context) async {

    if (_usernameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
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
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password:
                    _passwordController.text);
        print("Account Created");
        Fluttertoast.showToast(
          msg: "Account Created",
          backgroundColor: Colors.green[600],
          timeInSecForIosWeb: 1,
          fontSize: 15.0,
        );
        if (!mounted) return;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const SignIn()));
      } on FirebaseAuthException catch (ex) {
        if (ex.code == "weak-password") {
          Fluttertoast.showToast(
            msg: "Week Password",
            backgroundColor: Colors.red,
            timeInSecForIosWeb: 1,
            fontSize: 15.0,
          );
          print("Weak Password");
        } else if (ex.code ==
            "email-already-in-use") {
          Fluttertoast.showToast(
            msg: "Email Already exists",
            backgroundColor: Colors.red[400],
            timeInSecForIosWeb: 1,
            fontSize: 15.0,
          );
          print(
              "Email Already exists Login Please !");
        }
      } catch (ex) {
        print(ex);
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
                    imgUrl: "assets/images/register.png",
                  ),
                  const PageTitleBar(title: 'Welcome'),
                  Padding(
                    padding: const EdgeInsets.only(top: 340.0),
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
                                RoundedInputField(
                                  placeholder: "Email",
                                  prefixIcon: const Icon(Icons.email),
                                  myController: _emailController,
                                  icon: Icons.email,
                                ),
                                RoundedInputField(
                                  placeholder: "Name",
                                  prefixIcon: const Icon(Icons.person),
                                  myController: _usernameController, 
                                  icon: Icons.person,
                                ),
                                RoundedPasswordField(
                                  myController: _passwordController,
                                  obscure: true,
                                  placeholder: "Password",
                                  prefixIcon: const Icon(Icons.password),
                                  suffixIcon: null
                                ),
                                RoundedButton(
                                        text: 'REGISTER',
                                        press: () => _register(context),
                                      ),
                                const SizedBox(
                                  height: 10,
                                ),
                                UnderPart(
                                    title: "Already have an account?",
                                    navigatorText: "Login here",
                                    onTap: () {
                                       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignIn()));
                                    }),
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
