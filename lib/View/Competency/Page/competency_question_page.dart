// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Competency/Page/competency_result_page.dart';
import 'package:coursia/View/Competency/bloc/competency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompetencyQuestionPage extends StatelessWidget {
  CompetencyQuestionPage({super.key});
  List answerList = [
    {"id": 0, "name": "Strongly Agree"},
    {"id": 1, "name": "Agree"},
    {"id": 2, "name": "Undecided"},
    {"id": 3, "name": "Disagree"},
    {"id": 4, "name": "Strongly Disagree"}
  ];
  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Competency Test', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<CompetencyBloc, CompetencyState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        return Padding(
            padding: EdgeInsets.all(15.w),
            child: ListView(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                const CustomText(
                  text: 'Question 1/10',
                  textColor: AppTheme.orange,
                  textAlign: TextAlign.left,
                ),

                CustomFunction.customSpace(height: 20.h),
                const CustomText(
                  text: 'Who is first discovered Dynamite?',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.center,
                  size: 17,
                  fontWeight: FontWeight.bold,
                ),
                CustomFunction.customSpace(height: 30.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: answerList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomAnswerContainer(
                          text: answerList[index]["name"],
                          index: index,
                          currentIndex: onTapIndex,
                          boxColor: onTapIndex == 0 || onTapIndex == 1
                              ? AppTheme.green
                              : onTapIndex == 2
                                  ? AppTheme.grey
                                  : onTapIndex == 3 || onTapIndex == 4
                                      ? AppTheme.red
                                      : AppTheme.greyLight,
                          onTap: () {
                            context
                                .read<CompetencyBloc>()
                                .add(OnTapEvent(onTapIndex: index));
                          },
                        ),
                        CustomFunction.customSpace(height: 10.h)
                      ],
                    );
                  },
                ),
                CustomFunction.customSpace(height: 20.h),
                // CustomButton(
                //   onTap: () {},
                //   text: 'Next',
                //   textColor: AppTheme.white,
                //   bgcolor:
                //       onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      width: 150.w,
                      onTap: () {},
                      text: 'Previous',
                      textColor: AppTheme.white,
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
                    CustomButton(
                      width: 150.w,
                      onTap: () {
                        CustomFunction.navigatePage(
                            const CompetencyResultPage(), context);
                      },
                      text: 'Next',
                      textColor: AppTheme.white,
                      bgcolor:
                          onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                    ),
                  ],
                ),
              ],
            ));
      },
    );
  }
}
