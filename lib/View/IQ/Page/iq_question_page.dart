// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/IQ/bloc/iq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IqQuestionPage extends StatelessWidget {
  final List<IQQuestionModel>? iqQuestionList;
  final IQQuestionModel? iqQuestionModel;
  final int? index;
  final int? listLength;
  IqQuestionPage(
      {super.key,
      required this.iqQuestionList,
      required this.iqQuestionModel,
      required this.index,
      required this.listLength});

  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'iQ Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (iqQuestionList![index!].selectIqAnswer == null) {
      context.read<IqBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context
          .read<IqBloc>()
          .add(OnTapEvent(onTapIndex: iqQuestionList![index!].selectIqAnswer));
    }
  }

  bodyData(BuildContext context) {
    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<IqBloc, IQState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
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
                  text: iqQuestionModel!.questionName ?? "",
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
                    itemCount: iqQuestionModel?.iqAnswer?.length,
                    itemBuilder: (context, j) {
                      return Column(
                        children: [
                          CustomAnswerContainer(
                            text: iqQuestionModel?.iqAnswer?[j].answer ?? "",
                            index: j,
                            currentIndex: onTapIndex,
                            boxColor: AppTheme.orange,
                            onTap: () {
                              log(j.toString());
                              selectIndex = j;
                              context
                                  .read<IqBloc>()
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
                              iqQuestionModel?.selectIqAnswer == null) {
                            CustomFunction.flushBar(
                                'Please select one of the answers!', context,
                                msgColor: AppTheme.red);
                          } else {
                            selectIndex == null
                                ? iqQuestionModel?.selectIqAnswer =
                                    iqQuestionList![index!].selectIqAnswer
                                : iqQuestionModel?.selectIqAnswer = selectIndex;

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IqQuestionPage(
                                          iqQuestionList: iqQuestionList,
                                          iqQuestionModel:
                                              iqQuestionList?[index! + 1],
                                          index: index! + 1,
                                          listLength: listLength,
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
                                      ? iqQuestionModel?.selectIqAnswer =
                                          iqQuestionList![index!].selectIqAnswer
                                      : iqQuestionModel?.selectIqAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IqQuestionPage(
                                                iqQuestionList: iqQuestionList,
                                                iqQuestionModel:
                                                    iqQuestionList?[index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
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
                                      iqQuestionModel?.selectIqAnswer == null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? iqQuestionModel?.selectIqAnswer =
                                            iqQuestionList![index!]
                                                .selectIqAnswer
                                        : iqQuestionModel?.selectIqAnswer =
                                            selectIndex;
                                    log(iqQuestionList.toString());
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
                                      ? iqQuestionModel?.selectIqAnswer =
                                          iqQuestionList![index!].selectIqAnswer
                                      : iqQuestionModel?.selectIqAnswer =
                                          selectIndex;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => IqQuestionPage(
                                                iqQuestionList: iqQuestionList,
                                                iqQuestionModel:
                                                    iqQuestionList?[index! - 1],
                                                index: index! - 1,
                                                listLength: listLength,
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
                                      iqQuestionModel?.selectIqAnswer == null) {
                                    CustomFunction.flushBar(
                                        'Please select one of the answers!',
                                        context,
                                        msgColor: AppTheme.red);
                                  } else {
                                    selectIndex == null
                                        ? iqQuestionModel?.selectIqAnswer =
                                            iqQuestionList![index!]
                                                .selectIqAnswer
                                        : iqQuestionModel?.selectIqAnswer =
                                            selectIndex;

                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                IqQuestionPage(
                                                  iqQuestionList:
                                                      iqQuestionList,
                                                  iqQuestionModel:
                                                      iqQuestionList?[
                                                          index! + 1],
                                                  index: index! + 1,
                                                  listLength: listLength,
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
