// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/techanical_courses_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  final topicController = TextEditingController();
  final costController = TextEditingController();
  final levelController = TextEditingController();
  final List<String> topicList = ['Manager', 'Non-Manager', 'GA', 'Admin'];
  String? tapTitle;
  @override
  Widget build(BuildContext context) {
    context.read<CoursesBloc>().add(const OnTapEvent(type: 'Technical'));

    return Scaffold(
      body: BlocConsumer<CoursesBloc, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OnTapSuccess) {
            tapTitle = state.type;
            context.read<CoursesBloc>().add(const GetCoursesList(
                mainCategoryName: 'Technical', filterList: []));
          }
          return Padding(
            padding: const EdgeInsets.all(15.0).w,
            child: Column(
              children: [
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      color: AppTheme.greyLight),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 8)
                            .w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Technical'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Technical',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Technical'));
                            }),
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Functional'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Functional',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Functional'));
                            }),
                        CustomButton(
                            borderRadius: 5.r,
                            bgcolor: tapTitle == 'Behavioural'
                                ? AppTheme.white
                                : AppTheme.greyLight,
                            textColor: AppTheme.blackLight,
                            text: 'Behavioural',
                            width: 100.w,
                            height: 30.h,
                            onTap: () {
                              context
                                  .read<CoursesBloc>()
                                  .add(const OnTapEvent(type: 'Behavioural'));
                            }),
                      ],
                    ),
                  ),
                ),
                CustomFunction.customSpace(height: 10),
                tapTitle == 'Technical'
                    ? TechanicalCoursesPage(
                        isFromFeature: false,
                      )
                    : Container()
              ],
            ),
          );
        },
      ),
    );
  }
}
