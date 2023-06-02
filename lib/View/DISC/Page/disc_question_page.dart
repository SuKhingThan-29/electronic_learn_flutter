// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/DISC/bloc/disc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DISCQuestionPage extends StatelessWidget {
  final List<DISCQuestionModel>? discQuestionList;
  final DISCQuestionModel? discQuestionModel;
  final int? index;
  final int? listLength;
  final int? tapIndex;
  DISCQuestionPage(
      {super.key,
      this.discQuestionList,
      required this.discQuestionModel,
      required this.index,
      required this.listLength,
      required this.tapIndex});

  int? onTapIndex = -1;
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'DISC Test', data: bodyData(context));
  }

  checkSelectIndex(BuildContext context) {
    if (discQuestionList![index!].selectQuestion == null) {
      context.read<DISCBloc>().add(const OnTapEvent(onTapIndex: -1));
    } else {
      context.read<DISCBloc>().add(
          OnTapEvent(onTapIndex: discQuestionList![index!].selectQuestion));
    }
  }

  bodyData(BuildContext context) {
    // log(StaticData.discAnswerList.toString());

    int no = index! + 1;
    checkSelectIndex(context);
    return BlocConsumer<DISCBloc, DISCState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        return Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFunction.customSpace(height: 10.h),
              CustomText(
                text: 'Question $no/$listLength',
                textColor: AppTheme.orange,
              ),
              CustomFunction.customSpace(height: 40.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: discQuestionList?[index!].questions?.length,
                  itemBuilder: (context, j) {
                    return Column(
                      children: [
                        CustomAnswerContainer(
                          text: discQuestionList?[index!]
                                  .questions![j]
                                  .questionName ??
                              "",
                          index: j,
                          currentIndex: onTapIndex,
                          boxColor: AppTheme.orange,
                          onTap: () {
                            selectIndex = j;
                            context
                                .read<DISCBloc>()
                                .add(OnTapEvent(onTapIndex: j));
                          },
                        ),
                        CustomFunction.customSpace(height: 10)
                      ],
                    );
                  },
                ),
              ),
              CustomFunction.customSpace(height: 20),
              index == 0
                  ? CustomButton(
                      onTap: () {
                        if (selectIndex == null &&
                            discQuestionModel?.selectQuestion == null) {
                          CustomFunction.flushBar(
                              'Please select one of the answers!', context,
                              msgColor: AppTheme.red);
                        } else {
                          selectIndex == null
                              ? discQuestionModel?.selectQuestion =
                                  discQuestionList![index!].selectQuestion
                              : discQuestionModel?.selectQuestion = selectIndex;

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DISCQuestionPage(
                                        discQuestionList: discQuestionList,
                                        discQuestionModel:
                                            discQuestionList?[index! + 1],
                                        index: index! + 1,
                                        listLength: listLength,
                                        tapIndex: onTapIndex,
                                      )));
                        }
                      },
                      text: 'Next',
                      textColor: AppTheme.white,
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    )
                  : index == listLength! - 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              width: 150.w,
                              onTap: () {
                                selectIndex == null
                                    ? discQuestionModel?.selectQuestion =
                                        discQuestionList![index!].selectQuestion
                                    : discQuestionModel?.selectQuestion =
                                        selectIndex;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DISCQuestionPage(
                                              discQuestionList:
                                                  discQuestionList,
                                              discQuestionModel:
                                                  discQuestionList?[index! - 1],
                                              index: index! - 1,
                                              listLength: listLength,
                                              tapIndex: onTapIndex,
                                            )));
                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! - 1],
                                //       index: index! - 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
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
                                    discQuestionModel?.selectQuestion == null) {
                                  CustomFunction.flushBar(
                                      'Please select one of the answers!',
                                      context,
                                      msgColor: AppTheme.red);
                                } else {
                                  selectIndex == null
                                      ? discQuestionModel?.selectQuestion =
                                          discQuestionList![index!]
                                              .selectQuestion
                                      : discQuestionModel?.selectQuestion =
                                          selectIndex;
                                  log(discQuestionList.toString());
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
                                    ? discQuestionModel?.selectQuestion =
                                        discQuestionList![index!].selectQuestion
                                    : discQuestionModel?.selectQuestion =
                                        selectIndex;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DISCQuestionPage(
                                              discQuestionList:
                                                  discQuestionList,
                                              discQuestionModel:
                                                  discQuestionList?[index! - 1],
                                              index: index! - 1,
                                              listLength: listLength,
                                              tapIndex: onTapIndex,
                                            )));

                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! - 1],
                                //       index: index! - 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
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
                                    discQuestionModel?.selectQuestion == null) {
                                  CustomFunction.flushBar(
                                      'Please select one of the answers!',
                                      context,
                                      msgColor: AppTheme.red);
                                } else {
                                  selectIndex == null
                                      ? discQuestionModel?.selectQuestion =
                                          discQuestionList![index!]
                                              .selectQuestion
                                      : discQuestionModel?.selectQuestion =
                                          selectIndex;

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DISCQuestionPage(
                                                discQuestionList:
                                                    discQuestionList,
                                                discQuestionModel:
                                                    discQuestionList?[
                                                        index! + 1],
                                                index: index! + 1,
                                                listLength: listLength,
                                                tapIndex: onTapIndex,
                                              )));
                                }

                                // CustomFunction.navigatePage(
                                //     DISCQuestionPage(
                                //       discQuestionList: discQuestionList,
                                //       discQuestionModel:
                                //           discQuestionList?[index! + 1],
                                //       index: index! + 1,
                                //       listLength: listLength,
                                //     ),
                                //     context);
                              },
                              text: 'Next',
                              textColor: AppTheme.white,
                              bgcolor: onTapIndex != -1
                                  ? AppTheme.black
                                  : AppTheme.greyDark,
                            ),
                          ],
                        )
            ],
          ),
        );
      },
    );
  }
}
