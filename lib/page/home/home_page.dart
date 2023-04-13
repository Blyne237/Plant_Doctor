import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/constants.dart';
import 'package:flutter_application_blyne_1/page/home/tab_navigator.dart';
import 'package:unicons/unicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<Home> {
  String _currentPage = "Page2";
  List<String> pageKeys = ["Page1", "Page2", "Page3"];
  final Map<String, GlobalKey<NavigatorState>>  _navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
  };
  int _selectedIndex = 0;

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "Page1") {
            _selectTab("Page1", 1);

            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator("Page1"),
          _buildOffstageNavigator("Page2"),
          _buildOffstageNavigator("Page3"),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: kPrimaryColor,
          onTap: (int index) {
            _selectTab(pageKeys[index], index);
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(UniconsLine.estate),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon:  Icon(UniconsLine.capture),
              label: "Analyse",
            ),
            BottomNavigationBarItem(
              icon:  Icon(UniconsLine.user),
              label:  "Profile",
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
