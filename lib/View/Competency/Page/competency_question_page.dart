// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Competency/bloc/competency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompetencyQuestionPage extends StatelessWidget {
  final List<CompetencyQuestionModel>? competencyQuestionList;
  final CompetencyQuestionModel? competencyQuestionModel;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  CompetencyQuestionPage(
      {super.key,
      this.competencyQuestionList,
      required this.competencyQuestionModel,
      required this.index,
      required this.listLength,
      required this.tapIndex});
  List answerList = [
    {"id": 0, "name": "Strongly Agree"},
    {"id": 1, "name": "Agree"},
    {"id": 2, "name": "Undecided"},
    {"id": 3, "name": "Disagree"},
    {"id": 4, "name": "Strongly Disagree"}
  ];
  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Competency Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (competencyQuestionList![index!].selectAnswer == null) {
      context.read<CompetencyBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context.read<CompetencyBloc>().add(
          OnTapEvent(onTapIndex: competencyQuestionList![index!].selectAnswer));
    }
  }

  bodyData(BuildContext context) {
    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<CompetencyBloc, CompetencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        return Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                CustomText(
                  text: 'Question $no/$listLength',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),
                CustomFunction.customSpace(height: 20.h),
                CustomText(
                  text: competencyQuestionModel?.question,
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
                    itemCount: answerList.length,
                    itemBuilder: (context, j) {
                      return Column(
                        children: [
                          CustomAnswerContainer(
                            text: answerList[j]["name"],
                            index: j,
                            currentIndex: onTapIndex,
                            boxColor: onTapIndex == 0 || onTapIndex == 1
                                ? AppTheme.green
                                : onTapIndex == 2
                                    ? AppTheme.grey
                                    : onTapIndex == 3 || onTapIndex == 4
                                        ? AppTheme.red
                                        : AppTheme.greyLight,
                            onTap: () {
                              selectIndex = j;
                              context
                                  .read<CompetencyBloc>()
                                  .add(OnTapEvent(onTapIndex: j));
                            },
                          ),
                          CustomFunction.customSpace(height: 10.h)
                        ],
                      );
                    },
                  ),
                ),
                // CustomFunction.customSpace(height: 20.h),
                index == 0
                    ? CustomButton(
                        onTap: () {
                          if (selectIndex == null &&
                              competencyQuestionModel?.selectAnswer == null) {
                            CustomFunction.flushBar(
                                'Please select one of the answers!', context,
                                msgColor: AppTheme.red);
                          } else {
                            selectIndex == null
                                ? competencyQuestionModel?.selectAnswer =
                                    competencyQuestionList![index!].selectAnswer
                                : competencyQuestionModel?.selectAnswer =
                                    selectIndex;

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompetencyQuestionPage(
                                          competencyQuestionList:
                                              competencyQuestionList,
                                          competencyQuestionModel:
                                              competencyQuestionList?[
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
                      )
                    : index == listLength! - 1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                width: 150.w,
                                onTap: () {
                                  selectIndex == null
                                      ? competencyQuestionModel?.selectAnswer =
                                          competencyQuestionList![index!]
                                              .selectAnswer
                                      : competencyQuestionModel?.selectAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CompetencyQuestionPage(
                                                competencyQuestionList:
                                                    competencyQuestionList,
                                                competencyQuestionModel:
                                                    competencyQuestionList?[
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
                                      competencyQuestionModel?.selectAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? competencyQuestionModel
                                                ?.selectAnswer =
                                            competencyQuestionList![index!]
                                                .selectAnswer
                                        : competencyQuestionModel
                                            ?.selectAnswer = selectIndex;
                                    log(competencyQuestionList.toString());
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
                                      ? competencyQuestionModel?.selectAnswer =
                                          competencyQuestionList![index!]
                                              .selectAnswer
                                      : competencyQuestionModel?.selectAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CompetencyQuestionPage(
                                                competencyQuestionList:
                                                    competencyQuestionList,
                                                competencyQuestionModel:
                                                    competencyQuestionList?[
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
                                      competencyQuestionModel?.selectAnswer ==
                                          null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? competencyQuestionModel
                                                ?.selectAnswer =
                                            competencyQuestionList![index!]
                                                .selectAnswer
                                        : competencyQuestionModel
                                            ?.selectAnswer = selectIndex;

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompetencyQuestionPage(
                                                  competencyQuestionList:
                                                      competencyQuestionList,
                                                  competencyQuestionModel:
                                                      competencyQuestionList?[
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
