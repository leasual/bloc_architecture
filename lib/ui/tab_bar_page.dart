import 'package:bloc_architecture/di/injection.dart';
import 'package:bloc_architecture/ui/girl/girl_page.dart';
import 'package:bloc_architecture/ui/home/home_page.dart';
import 'package:bloc_architecture/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';

import 'component/bottom_tab_bar.dart';

class TabBarPage extends StatefulWidget {

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  final String tag = "_TabBarPageState";

  List<Widget> _pages = [
    HomePage(),
    GirlPage(),
    SettingsPage(),
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _pages[_currentPage],
      bottomNavigationBar: BottomTabBar(
        barItems: [
          BottomBarItem(title: "Home", image: "assets/images/home-outline.svg"),
          BottomBarItem(title: "Photo", image: "assets/images/grid-outline.svg"),
          BottomBarItem(title: "Settings", image: "assets/images/settings-outline.svg"),
        ],
        onTabChanged: (index) {
          logger.d(tag, "select item index= $index");
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
