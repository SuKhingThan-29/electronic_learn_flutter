// ignore_for_file: must_be_immutable

import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Quiz/Page/quiz_question_page.dart';
import 'package:coursia/View/Quiz/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizMainPage extends StatelessWidget {
  QuizMainPage({
    super.key,
  });

  List<QuizTypeModel> quizTypeList = [];
  List<QuizQuestionModel> quizQuestionList = [];

  @override
  Widget build(BuildContext context) {
    context.read<QuizBloc>().add(const GetQuizTypeEvent());
    return CusotmScaffold(text: 'Quiz', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is GetQuizQuestionListSuccess) {
          quizQuestionList = state.quizQuestionList;
          context.read<QuizBloc>().add(const GetQuizTypeEvent());
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuizQuestionPage(
                        quizQuestionList: quizQuestionList,
                        quizQuestionModel: quizQuestionList[0],
                        index: 0,
                        listLength: quizQuestionList.length,
                        tapIndex: -1,
                      )));
        }
      },
      builder: (context, state) {
        if (state is GetQuizTypeLoading ||
            state is GetQuizQuestionListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetQuizTypeSuccess) {
          quizTypeList = state.quizTypeList;
          return Padding(
            padding: EdgeInsets.all(15.w),
            child: ListView(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListView.builder(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: quizTypeList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: 150.h,
                            decoration:
                                const BoxDecoration(color: AppTheme.greyLight),
                            child: Padding(
                              padding: EdgeInsets.all(8.w),
                              child: Row(children: [
                                Image.asset(
                                  'images/chart.png',
                                  width: 170.w,
                                  height: 120.h,
                                  fit: BoxFit.fill,
                                ),
                                CustomFunction.customSpace(width: 20.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                          text: quizTypeList[index].name,
                                          textColor: AppTheme.black),
                                      CustomText(
                                          text: '10 quiz',
                                          textColor: AppTheme.black,
                                          size: 11.sp),
                                      index > 1
                                          ? const CircleAvatar(
                                              backgroundColor:
                                                  AppTheme.orangeLight,
                                              child: Icon(
                                                Icons.lock,
                                                color: AppTheme.orange,
                                              ),
                                            )
                                          : CustomButton(
                                              bgcolor: AppTheme.black,
                                              text: 'Test Now ->',
                                              fontSize: 12.sp,
                                              onTap: () {
                                                context.read<QuizBloc>().add(
                                                    GetQuizQuestionListEvent(
                                                        quizTypeId:
                                                            quizTypeList[index]
                                                                .id));
                                              },
                                              width: 90.w,
                                              height: 25.h,
                                              textColor: AppTheme.white,
                                              borderRadius: 20.r),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                          CustomFunction.customSpace(height: 10.h)
                        ],
                      );
                    }),
              ],
            ),
          );
        }
        if (state is GetQuizTypeFailed || state is GetQuizQuestionListFailed) {
          return CustomButton(
              text: 'Reload Quiz Type',
              onTap: () {
                context.read<QuizBloc>().add(const GetQuizTypeEvent());
              });
        }
        return Container();
      },
    );
  }
}
