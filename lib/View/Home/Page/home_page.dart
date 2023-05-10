// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/custom_appbar.dart';
import 'package:coursia/View//Home/Page/feature_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assessment/Page/assessment_page.dart';
import 'package:coursia/View/Courses/Page/courses_page.dart';
import 'package:coursia/View/Gift/Page/gift_empty_page.dart';
import 'package:coursia/View/Gift/Page/gift_page.dart';
import 'package:coursia/View/Profile/Page/profile_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  static const List<_BottomTab> bottomTabs = <_BottomTab>[
    _BottomTab('Feature', Icon(Icons.home)),
    _BottomTab('Browse', Icon(Icons.menu)),
    _BottomTab('Assessment', Icon(Icons.assignment)),
    _BottomTab('Gift', Icon(Icons.card_giftcard_outlined))
  ];
  List<Widget> destinations = <Widget>[
    const FeaturePage(),
    CoursesPage(),
    const AssessmentPage(),
    GiftPage()
    //const GiftEmptyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        username: 'Arkar',
        onTap: () {
          CustomFunction.navigatePage(const ProfilePage(), context);
        },
      ),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: destinations,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(color: AppTheme.orange),
        selectedItemColor: AppTheme.orange,
        unselectedItemColor: AppTheme.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: bottomTabs
            .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.title))
            .toList(),
      ),
    );
  }
}

class _BottomTab {
  final String title;
  final Icon icon;

  const _BottomTab(this.title, this.icon);
}
