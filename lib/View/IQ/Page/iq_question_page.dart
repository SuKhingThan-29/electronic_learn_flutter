// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/IQ/Page/iq_result_page.dart';
import 'package:coursia/View/IQ/bloc/iq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IqQuestionPage extends StatelessWidget {
  IqQuestionPage({super.key});
  List answerList = [
    {"id": 0, "name": "Alfred Nobel"},
    {"id": 1, "name": "Albert Einstein"},
    {"id": 2, "name": "Donna Strickland"},
    {"id": 3, "name": "Isamu Akasaki"}
  ];
  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'iQ Test', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<IqBloc, IQState>(
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
                CustomFunction.customSpace(height: 10.h),
                Image.asset(
                  'images/chart.png',
                  // width: 180.w,
                  height: 150.h,
                  //fit: BoxFit.fill,
                ),
                CustomFunction.customSpace(height: 20.h),
                const CustomText(
                  text: 'Who is Gary Vee?',
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
                          boxColor: AppTheme.orange,
                          onTap: () {
                            context
                                .read<IqBloc>()
                                .add(OnTapEvent(onTapIndex: index));
                          },
                        ),
                        CustomFunction.customSpace(height: 10)
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
                            const IQResultPage(), context);
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
