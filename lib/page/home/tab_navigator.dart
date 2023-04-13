import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/page/analyse/analyse_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_screen.dart';
import 'package:flutter_application_blyne_1/page/profile/profile_page.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigator(
      {Key? key, required this.navigatorKey, required this.tabItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;

    child =  const HomeScreen();

    if (tabItem == "Page1") {
      child = const HomeScreen();
    } else if (tabItem == "Page2") {
      child = const Analyse();
    } else if (tabItem == "Page3") {
      child = const ProfilePage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
