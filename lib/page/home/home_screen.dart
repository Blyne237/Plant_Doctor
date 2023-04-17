import 'package:flutter/material.dart';
import 'package:flutter_application_blyne_1/page/analyse/analyse_page.dart';
import 'package:flutter_application_blyne_1/page/home/home_tab.dart';
import 'package:unicons/unicons.dart';




import '../../constants.dart';
import '../analyse/analyse_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(1);
  }

  static const List<Tab> _tabs = [
    Tab(child:  Text('Tab One')),
    Tab( text: 'Tab Two'),

  ];

  static const List<Widget> _views = [
     Daignose(),
    AnalyseTab(),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,

        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor:kPrimaryColor,
              unselectedLabelColor: Colors.white,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              
              overlayColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return kPrimaryLightColor;
                }
                if (states.contains(MaterialState.focused)) {
                  return Colors.orange;
                } else if (states.contains(MaterialState.hovered)) {
                  return Colors.pinkAccent;
                }

                return Colors.transparent;
              }),
              indicatorWeight: 5,
              indicatorColor: kPrimaryLightColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.only(
                right: -10,
                left: -10
              ),
              indicator: BoxDecoration(
                border: Border.all(color: kPrimaryLightColor),
                borderRadius: BorderRadius.circular(25),
                color: kPrimaryLightColor,
              ),
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              onTap: (int index) {
                print('Tab $index is tapped');
              },
              enableFeedback: true,
              // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
              // controller: _tabController,
              tabs: _tabs,
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(UniconsLine.arrow_left, size: 30),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil,
            ),
            title: const Text('Home'),
            backgroundColor: kPrimaryColor,
          ),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            // Uncomment the line below and remove DefaultTabController if you want to use a custom TabController
            // controller: _tabController,
            children: _views,
          ),
        ),
      ),
    );
  }
}
