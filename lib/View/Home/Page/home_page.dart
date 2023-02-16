// ignore_for_file: must_be_immutable

import 'package:coursia/View//Home/Page/feature_page.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assessment/assessment.dart';
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
    const FeaturePage(),
    const AssessmentPage(),
    const FeaturePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomFunction.appBar(username: 'Arkar'),
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
