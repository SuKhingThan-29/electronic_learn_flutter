// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:coursia/Model/static_data.dart';
import 'package:coursia/UIDesign/custom_appbar.dart';
import 'package:coursia/View//Home/Page/feature_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assessment/Page/assessment_page.dart';
import 'package:coursia/View/Courses/Page/courses_page.dart';
import 'package:coursia/View/Gift/Page/gift_page.dart';
import 'package:coursia/View/Home/bloc/home_bloc.dart';
import 'package:coursia/View/Profile/Page/profile_page.dart';
import 'package:coursia/View/Trainer/trainer_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var _currentIndex = 0;
  static const List<_BottomTab> bottomTabs = <_BottomTab>[
    _BottomTab('Feature', Icon(Icons.home)),
    _BottomTab('Browse', Icon(Icons.menu)),
    _BottomTab('Assessment', Icon(Icons.assignment)),
    _BottomTab('Gift', Icon(Icons.card_giftcard_outlined)),
    _BottomTab('Trainer', Icon(Icons.person))
  ];
  List<Widget> destinations = <Widget>[
    const FeaturePage(),
    CoursesPage(),
    AssessmentPage(),
    GiftPage(),
    const TrainerListPage()
    //const GiftEmptyPage()
  ];
  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(OnTapEvent(onTapIndex: _currentIndex));
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          _currentIndex = state.onTapIndex!;
        }
        return Scaffold(
          appBar: CustomAppBar(
            username: StaticData.loginResponseModel?.data?.user?.name ?? "",
            onTap: () {
              CustomFunction.navigatePage(ProfilePage(), context);
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
              context.read<HomeBloc>().add(OnTapEvent(onTapIndex: index));
              // setState(() {
              //   _currentIndex = index;
              // });
            },
            items: bottomTabs
                .map((e) =>
                    BottomNavigationBarItem(icon: e.icon, label: e.title))
                .toList(),
          ),
        );
      },
    );
  }
}

class _BottomTab {
  final String title;
  final Icon icon;

  const _BottomTab(this.title, this.icon);
}
