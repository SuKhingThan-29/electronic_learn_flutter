// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Quiz/bloc/quiz_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizQuestionPage extends StatelessWidget {
  final List<QuizQuestionModel>? quizQuestionList;
  final QuizQuestionModel? quizQuestionModel;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  QuizQuestionPage(
      {super.key,
      this.quizQuestionList,
      required this.quizQuestionModel,
      required this.index,
      required this.listLength,
      required this.tapIndex});

  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<QuizBloc>().add(const GetQuizTypeEvent());
        return true;
      },
      child: CusotmScaffold(
          text: quizQuestionModel?.quizType?.name, data: bodyData(context)),
    );
  }

  checkSelectIndex(BuildContext context) {
    if (quizQuestionList![index!].selectQuizAnswer == null) {
      context.read<QuizBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context.read<QuizBloc>().add(
          OnTapEvent(onTapIndex: quizQuestionList![index!].selectQuizAnswer));
    }
  }

  bodyData(BuildContext context) {
    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
          // context.read<QuizBloc>().add(const GetQuizTypeEvent());
        }
        return Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              // shrinkWrap: true,
              // physics: const ScrollPhysics(),
              children: [
                CustomText(
                  text: 'Question $no/$listLength',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),
                CustomFunction.customSpace(height: 10.h),
                Image.asset(
                  'images/chart.png',
                  // width: 180.w,
                  height: 150.h,
                  //fit: BoxFit.fill,
                ),
                CustomFunction.customSpace(height: 20.h),
                CustomText(
                  text: quizQuestionModel?.questionName ?? "",
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                CustomFunction.customSpace(height: 30.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: quizQuestionModel?.quizAnswer?.length,
                    itemBuilder: (context, j) {
                      return Column(
                        children: [
                          CustomAnswerContainer(
                            text: quizQuestionModel?.quizAnswer?[j].answer,
                            index: j,
                            currentIndex: onTapIndex,
                            boxColor: AppTheme.orange,
                            onTap: () {
                              selectIndex = j;
                              context
                                  .read<QuizBloc>()
                                  .add(OnTapEvent(onTapIndex: j));
                            },
                          ),
                          CustomFunction.customSpace(height: 10)
                        ],
                      );
                    },
                  ),
                ),
                CustomFunction.customSpace(height: 20.h),
                index == 0
                    ? CustomButton(
                        onTap: () {
                          if (selectIndex == null &&
                              quizQuestionModel?.selectQuizAnswer == null) {
                            CustomFunction.flushBar(
                                'Please select one of the answers!', context,
                                msgColor: AppTheme.red);
                          } else {
                            selectIndex == null
                                ? quizQuestionModel?.selectQuizAnswer =
                                    quizQuestionList![index!].selectQuizAnswer
                                : quizQuestionModel?.selectQuizAnswer =
                                    selectIndex;

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizQuestionPage(
                                          quizQuestionList: quizQuestionList,
                                          quizQuestionModel:
                                              quizQuestionList?[index! + 1],
                                          index: index! + 1,
                                          listLength: listLength,
                                          tapIndex: onTapIndex,
                                        )));
                          }
                        },
                        text: 'Next',
                        textColor: AppTheme.white,
                        bgcolor: onTapIndex != -1
                            ? AppTheme.black
                            : AppTheme.greyDark,
                      )
                    : index == listLength! - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  selectIndex == null
                                      ? quizQuestionModel?.selectQuizAnswer =
                                          quizQuestionList![index!]
                                              .selectQuizAnswer
                                      : quizQuestionModel?.selectQuizAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuizQuestionPage(
                                                quizQuestionList:
                                                    quizQuestionList,
                                                quizQuestionModel:
                                                    quizQuestionList?[
                                                        index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                },
                                text: 'Previous',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  if (selectIndex == null &&
                                      quizQuestionModel?.selectQuizAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? quizQuestionModel?.selectQuizAnswer =
                                            quizQuestionList![index!]
                                                .selectQuizAnswer
                                        : quizQuestionModel?.selectQuizAnswer =
                                            selectIndex;
                                    log(quizQuestionList.toString());
                                  }
                                },
                                text: 'Submit',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  selectIndex == null
                                      ? quizQuestionModel?.selectQuizAnswer =
                                          quizQuestionList![index!]
                                              .selectQuizAnswer
                                      : quizQuestionModel?.selectQuizAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              QuizQuestionPage(
                                                quizQuestionList:
                                                    quizQuestionList,
                                                quizQuestionModel:
                                                    quizQuestionList?[
                                                        index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                },
                                text: 'Previous',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  if (selectIndex == null &&
                                      quizQuestionModel?.selectQuizAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? quizQuestionModel?.selectQuizAnswer =
                                            quizQuestionList![index!]
                                                .selectQuizAnswer
                                        : quizQuestionModel?.selectQuizAnswer =
                                            selectIndex;

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                QuizQuestionPage(
                                                  quizQuestionList:
                                                      quizQuestionList,
                                                  quizQuestionModel:
                                                      quizQuestionList?[
                                                          index! + 1],
                                                  index: index! + 1,
                                                  listLength: listLength,
                                                  tapIndex: onTapIndex,
                                                )));
                                  }
                                },
                                text: 'Next',
                                textColor: AppTheme.white,
                                bgcolor: onTapIndex != -1
                                    ? AppTheme.black
                                    : AppTheme.greyDark,
                              ),
                            ],
                          ),
              ],
            ));
      },
    );
  }
}
