import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        title: Text("Home"),
      ),
      body: SizedBox(
        
      ),
    );
  }
}
