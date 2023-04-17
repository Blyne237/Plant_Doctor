import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:unicons/unicons.dart';

import '../../components/under_part.dart';
import '../../components/upside.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //signout function
  signOut() async {
    await auth.signOut();
    // ignore: use_build_context_synchronously
   Navigator.of(context, rootNavigator: true).pushReplacement(
        MaterialPageRoute(builder: (context) =>  const SignIn()));
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
                const Upside(
                  imgUrl: "assets/images/Mobile login-cuate.png",
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
                       
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                              title: const Text("Hello"),
                              subtitle: Text(
                                // "UserName",
                                user!.email!,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 14),
                              ),
                              minLeadingWidth: 0,
                              leading: const CircleAvatar(
                                backgroundColor: Colors.grey,
                                backgroundImage:
                                    AssetImage('assets/icons/user.png'),
                                radius: 30,
                              ),
                              trailing: SizedBox(
                                height: double.infinity,
                                child: IconButton(
                                  icon: const Icon(UniconsLine.signout, size: 30),
                                  onPressed: () {
                                    signOut();
                                  },
                                ),
                              ),
                              ),
                        ),
                      )
                        ),
                        const SizedBox(
                          height: 50,
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
