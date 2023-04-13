import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/auth/login/login_page.dart';
import 'package:unicons/unicons.dart';

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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignIn()));
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(UniconsLine.arrow_left, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: kPrimaryColor,
        title: const Text("Profile"),
      ),
      body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
             Container(
                width: 350,
                height: 100,
                  decoration: BoxDecoration(
                    color: backGroundColor,
                      borderRadius: BorderRadius.circular(15)
                      ),
                  child: Column(
                    children: [
                      ListTile(
                          title: const Text("Hello"),
                          subtitle: Text(
                            "UserName",
                            // user!.email!,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12),
                          ),
                          minLeadingWidth: 0,
                          leading: CircleAvatar(
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
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
