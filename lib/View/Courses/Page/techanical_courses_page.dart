// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:coursia/Model/cost_model.dart';
import 'package:coursia/Model/courses_model.dart';
import 'package:coursia/Model/static_data.dart';
import 'package:coursia/Model/subcategory_model.dart';
import 'package:coursia/Model/user_level_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/custom_dropdown.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Courses/Page/courses_detail_page.dart';
import 'package:coursia/View/Courses/bloc/courses_bloc.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechanicalCoursesPage extends StatelessWidget {
  final bool? isFromFeature;
  TechanicalCoursesPage({super.key, this.isFromFeature});

  List<SubCategoryModel>? subCategoryList;
  List<CostModel> costList = [];
  List<UserLevelModel> userLevelList = [];

  final String? mainCategoryName = 'Technical';
  List<CoursesModel>? coursesList = [];
  List<String>? filterList = [];

  int? subId;
  int? costId;
  String? userLevelName;

  @override
  Widget build(BuildContext context) {
    return isFromFeature == true
        ? CusotmScaffold(
            text: 'Technical Course',
            data: bodyData(context, isFromFeature: true))
        : bodyData(context, isFromFeature: false);
  }

  bodyData(BuildContext context, {bool? isFromFeature}) {
    return isFromFeature!
        ? showList(context)
        : Expanded(
            child: showList(context),
          );
  }

  showList(BuildContext context) {
    return BlocConsumer<CoursesBloc, CoursesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCoursesListLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppTheme.orange),
          );
        }
        if (state is GetCoursesListSuccess) {
          coursesList = state.coursesList;
          filterList = state.filterList;
          return Padding(
            padding: isFromFeature!
                ? const EdgeInsets.all(15.0).w
                : const EdgeInsets.all(0),
            child: Column(children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () async {
                    showButtomSheet(context);
                  },
                  child: const Icon(
                    Icons.filter_list,
                    color: AppTheme.black,
                  ),
                ),
              ),
              filterList!.isEmpty
                  ? const Align(
                      alignment: Alignment.bottomLeft,
                      child: CustomText(
                        text: 'Technical All list',
                        textColor: AppTheme.black,
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomLeft,
                      child: SizedBox(
                        height: 30.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: filterList!.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                FilterList(
                                  fliterText: filterList![index],
                                  onTap: () {
                                    // filterList!.removeAt(index);
                                  },
                                ),
                                CustomFunction.customSpace(width: 5),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
              CustomFunction.customSpace(height: 10),
              coursesList!.isEmpty
                  ? Column(
                      children: [
                        CustomFunction.customSpace(height: 150),
                        const CustomText(
                          text: 'There is no data.',
                          textColor: AppTheme.black,
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: coursesList?.length,
                        itemBuilder: (context, index) {
                          return CustomCourseCard(
                              onTap: () {
                                CustomFunction.navigatePage(
                                    CourseDetialPage(), context);
                              },
                              isCart: false,
                              isWishlist: false,
                              isLearning: false,
                              isCertificate: false,
                              image: 'images/pana1.png',
                              title: coursesList?[index].title ?? "",
                              name: 'Joni Iskandar',
                              cost: '\$450',
                              time: '1h 35m ',
                              lessons: '17 Lessons');
                        },
                      ),
                    )
            ]),
          );
        }
        if (state is GetCoursesListFailed) {
          CustomFunction.flushBar(state.message, context,
              msgColor: AppTheme.red);
        }
        return const Center(
          child: CustomText(
            text: 'Something went wrong!',
            textColor: AppTheme.black,
          ),
        );
      },
    );
  }

  getCostList() {
    costList.clear();
    for (int i = 0; i < StaticData.costList.length; i++) {
      CostModel costModel = CostModel(
          id: StaticData.costList[i]['id'],
          name: StaticData.costList[i]['name']);
      costList.add(costModel);
    }
  }

  getUserLevelList() {
    userLevelList.clear();
    for (int i = 0; i < StaticData.userLevelList.length; i++) {
      UserLevelModel userLevelModel = UserLevelModel(
          id: StaticData.userLevelList[i]['id'],
          name: StaticData.userLevelList[i]['name']);
      userLevelList.add(userLevelModel);
    }
  }

  showButtomSheet(BuildContext context) {
    filterList = [];
    getCostList();
    getUserLevelList();
    context
        .read<CoursesBloc>()
        .add(const GetSubCategoryList(mainSubName: 'Technical'));

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
        return BlocConsumer<CoursesBloc, CoursesState>(
          listener: (context, state) {
            if (state is GetSubCategoryListFailed) {
              CustomFunction.flushBar(state.message, context,
                  msgColor: AppTheme.red);
            }
          },
          builder: (context, state) {
            if (state is GetSubCategoryListSuccess) {
              subCategoryList = state.subCategoryList;
            }
            if (state is GetSubCategoryListLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppTheme.orange),
              );
            }

            return WillPopScope(
              onWillPop: () async => true,
              child: SingleChildScrollView(
                child: AnimatedPadding(
                  padding: MediaQuery.of(context).viewInsets,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.decelerate,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                    // padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is GetDropDownValueSuccess) {
                          if (state.value.isTopic == true) {
                            // SubCategoryModel? subCategoryModel = state.value;
                            subId = state.value.id;
                            filterList!.add(state.value.name!);
                            // log(subCategoryModel!.name.toString());
                          }
                          if (state.value.isCost == true) {
                            // CostModel? costModel = state.value;
                            costId = state.value.id;
                            filterList!.add(state.value.name!);
                            // log(costModel!.name.toString());
                          }
                          if (state.value.isUserLevel == true) {
                            // UserLevelModel? userLevelModel = state.value;
                            userLevelName = state.value.name;
                            filterList!.add(state.value.name!);
                            // log(userLevelModel!.name.toString());
                          }
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                                text: 'Topic', textColor: AppTheme.blackLight),
                            CustomFunction.customSpace(height: 5.h),
                            CustomDropDown(
                              items: subCategoryList!,
                              hintText: 'Topic',
                              isSignUp: true,
                              isCourses: true,
                            ),
                            CustomFunction.customSpace(height: 10.h),
                            const CustomText(
                                text: 'Cost', textColor: AppTheme.blackLight),
                            CustomFunction.customSpace(height: 5.h),
                            CustomDropDown(
                              items: costList,
                              hintText: 'Cost',
                              isSignUp: true,
                              isCourses: true,
                            ),
                            CustomFunction.customSpace(height: 10.h),
                            const CustomText(
                                text: 'Level', textColor: AppTheme.blackLight),
                            CustomFunction.customSpace(height: 5.h),
                            CustomDropDown(
                              items: userLevelList,
                              hintText: 'Level',
                              isSignUp: true,
                              isCourses: true,
                            ),
                            CustomFunction.customSpace(height: 20.h),
                            Center(
                              child: CustomButton(
                                  text: 'Apply Filter',
                                  onTap: () {
                                    filterList = [];
                                    Navigator.of(context).pop();
                                    // if (subCategoryModel != null) {
                                    //   filterList!
                                    //       .add(subCategoryModel!.name!);
                                    // }
                                    // if (costModel != null) {
                                    //   filterList!.add(costModel!.name!);
                                    // }
                                    // if (userLevelModel != null) {
                                    //   filterList!.add(userLevelModel!.name!);
                                    // }
                                    context.read<CoursesBloc>().add(
                                        GetCoursesList(
                                            mainCategoryName: 'Technical',
                                            topic:
                                                subId, // subCategoryModel?.id,
                                            cost: costId, //?.id,
                                            level:
                                                userLevelName, // userLevelModel?.name,
                                            filterList: filterList));
                                  },
                                  width: 150.w),
                            ),
                            CustomFunction.customSpace(height: 10.h),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
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
      // height: 30.h,
      decoration: BoxDecoration(
          color: AppTheme.grey, borderRadius: BorderRadius.circular(5).r),
      child: Padding(
        padding: const EdgeInsets.all(8.0).w,
        child: Row(children: [
          CustomText(text: fliterText, textColor: AppTheme.blackLight),
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
