import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Quiz/Page/quiz_question_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizMainPage extends StatelessWidget {
  const QuizMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Quiz', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: ListView(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
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
                            width: 180.w,
                            height: 120.h,
                            fit: BoxFit.fill,
                          ),
                          CustomFunction.customSpace(width: 30.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const CustomText(
                                  text: 'Number', textColor: AppTheme.black),
                              CustomText(
                                  text: '10 quiz',
                                  textColor: AppTheme.black,
                                  size: 11.sp),
                              index > 1
                                  ? const CircleAvatar(
                                      backgroundColor: AppTheme.orangeLight,
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
                                        CustomFunction.navigatePage(
                                            QuizQuestionPage(), context);
                                      },
                                      width: 90.w,
                                      height: 25.h,
                                      textColor: AppTheme.white,
                                      borderRadius: 20.r),
                            ],
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
}
