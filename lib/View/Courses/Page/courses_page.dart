import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/custom_dropdown.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/courses_detail_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Profile/bloc/profile_bloc.dart';

class CoursesPage extends StatelessWidget {
  CoursesPage({super.key});

  final topicController = TextEditingController();
  final costController = TextEditingController();
  final levelController = TextEditingController();
  final List<String> topicList = ['Manager', 'Non-Manager', 'GA', 'Admin'];
  @override
  Widget build(BuildContext context) {
    context.read<CoursesBloc>().add(const OnTapEvent(type: 'Technical'));
    return Scaffold(
      body: BlocConsumer<CoursesBloc, CoursesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is OnTapSuccess) {
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
                              bgcolor: state.type == 'Technical'
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
                              bgcolor: state.type == 'Functional'
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
                              bgcolor: state.type == 'Behavioural'
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: 2,
                      //   itemBuilder: (context, index) {
                      //     return FilterList(
                      //       fliterText: 'Programming',
                      //       onTap: () {},
                      //     );
                      //   },
                      // ),
                      FilterList(
                        fliterText: 'Programming',
                        onTap: () {},
                      ),
                      InkWell(
                        onTap: () {
                          showButtomSheet(context);
                        },
                        child: const Icon(
                          Icons.filter_list,
                          color: AppTheme.black,
                        ),
                      ),
                    ],
                  ),
                  CustomFunction.customSpace(height: 10),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CustomCourseCard(
                            onTap: () {
                              // CustomFunction.navigatePage(
                              //     MultipleChoiceQuestionPage(), context);
                              // CustomFunction.navigatePage(
                              //     CaseStudyQuestionPage(), context);
                              // CustomFunction.navigatePage(
                              //     AssignmentResultPage(), context);
                              CustomFunction.navigatePage(
                                  CourseDetialPage(), context);
                            },
                            isCart: false,
                            isWishlist: false,
                            isLearning: false,
                            isCertificate: false,
                            image: 'images/pana1.png',
                            title: 'Data Visualization with R Language',
                            name: 'Joni Iskandar',
                            cost: '\$450',
                            time: '1h 35m ',
                            lessons: '17 Lessons');
                      },
                    ),
                  )
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  showButtomSheet(BuildContext context) {
    // showModalBottomSheet(
    //     isScrollControlled: true,
    //     isDismissible: false,
    //     enableDrag: false,
    //     backgroundColor: Colors.transparent,
    //     barrierColor: Colors.black.withOpacity(0.5),
    //     elevation: 5,
    //     context: context,
    //     builder: (ctx) => WillPopScope(
    //           onWillPop: () async => true,
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.vertical(
    //                   top: const Radius.circular(35).r, bottom: Radius.zero),
    //             ),
    //             height: 360.h,
    //             child: SingleChildScrollView(
    //               child: Padding(
    //                 padding:
    //                     EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
    //                 child: Column(
    //                   mainAxisSize: MainAxisSize.min,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     const CustomText(
    //                         text: 'Topic', textColor: AppTheme.blackLight),
    //                     CustomFunction.customSpace(height: 5.h),
    //                     CustomTextFormField(
    //                         controller: topicController,
    //                         isEmail: false,
    //                         isProfile: false,
    //                         hintText: 'Topic'),
    //                     CustomFunction.customSpace(height: 10.h),
    //                     const CustomText(
    //                         text: 'Cost', textColor: AppTheme.blackLight),
    //                     CustomFunction.customSpace(height: 5.h),
    //                     CustomTextFormField(
    //                         controller: costController,
    //                         isEmail: false,
    //                         isProfile: false,
    //                         hintText: 'Cost'),
    //                     CustomFunction.customSpace(height: 10.h),
    //                     const CustomText(
    //                         text: 'Level', textColor: AppTheme.blackLight),
    //                     CustomFunction.customSpace(height: 5.h),
    //                     CustomTextFormField(
    //                         controller: levelController,
    //                         isEmail: false,
    //                         isProfile: false,
    //                         hintText: 'Level'),
    //                     CustomFunction.customSpace(height: 20.h),
    //                     Center(
    //                       child: CustomButton(
    //                           text: 'Apply Filter',
    //                           onTap: () {
    //                             Navigator.of(context).pop();
    //                           },
    //                           width: 150.w),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ));

    showModalBottomSheet<void>(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      ),
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: SingleChildScrollView(
            child: AnimatedPadding(
              padding: MediaQuery.of(context).viewInsets,
              duration: const Duration(milliseconds: 100),
              curve: Curves.decelerate,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                // padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                        text: 'Topic', textColor: AppTheme.blackLight),
                    CustomFunction.customSpace(height: 5.h),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is GetDropDownValueSuccess) {
                          // jobLevel = state.value;
                          // log(jobLevel.toString());
                        }
                        return CustomDropDown(
                          items: topicList,
                          hintText: 'Topic',
                          isSignUp: true,
                          isCourses: true,
                        );
                      },
                    ),
                    CustomFunction.customSpace(height: 10.h),
                    const CustomText(
                        text: 'Cost', textColor: AppTheme.blackLight),
                    CustomFunction.customSpace(height: 5.h),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is GetDropDownValueSuccess) {
                          // jobLevel = state.value;
                          // log(jobLevel.toString());
                        }
                        return CustomDropDown(
                          items: topicList,
                          hintText: 'Cost',
                          isSignUp: true,
                          isCourses: true,
                        );
                      },
                    ),
                    CustomFunction.customSpace(height: 10.h),
                    const CustomText(
                        text: 'Level', textColor: AppTheme.blackLight),
                    CustomFunction.customSpace(height: 5.h),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is GetDropDownValueSuccess) {
                          // jobLevel = state.value;
                          // log(jobLevel.toString());
                        }
                        return CustomDropDown(
                          items: topicList,
                          hintText: 'Level',
                          isSignUp: true,
                          isCourses: true,
                        );
                      },
                    ),
                    CustomFunction.customSpace(height: 20.h),
                    Center(
                      child: CustomButton(
                          text: 'Apply Filter',
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          width: 150.w),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class FilterList extends StatelessWidget {
  final String? fliterText;
  final void Function()? onTap;
  const FilterList({super.key, required this.fliterText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
          color: AppTheme.grey, borderRadius: BorderRadius.circular(5).r),
      child: Padding(
        padding: const EdgeInsets.all(8.0).w,
        child: Row(children: [
          const CustomText(text: 'Programming', textColor: AppTheme.blackLight),
          CustomFunction.customSpace(width: 10),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.cancel,
              size: 15.sp,
              color: AppTheme.blackLight,
            ),
          ),
        ]),
      ),
    );
  }
}
