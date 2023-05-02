import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizResultPage extends StatelessWidget {
  const QuizResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Quiz Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            CustomFunction.customSpace(height: 20.h),
            Image.asset(
              'images/zoo.png',
              height: 150.h,
            ),
            CustomFunction.customSpace(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100.w,
                    child: const CustomText(
                      text: 'Total Quiz',
                      textColor: AppTheme.blackLight,
                      textAlign: TextAlign.left,
                    )),
                const Expanded(
                    child:
                        CustomText(text: '10', textColor: AppTheme.blackLight))
              ],
            ),
            CustomFunction.customSpace(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100.w,
                    child: const CustomText(
                      text: 'Correct',
                      textColor: AppTheme.green,
                      textAlign: TextAlign.left,
                    )),
                const Expanded(
                    child: CustomText(text: '9', textColor: AppTheme.green))
              ],
            ),
            CustomFunction.customSpace(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 100.w,
                    child: const CustomText(
                      text: 'In Correct',
                      textColor: AppTheme.red,
                      textAlign: TextAlign.left,
                    )),
                const Expanded(
                    child: CustomText(text: '1', textColor: AppTheme.red))
              ],
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomResultContainer(
              isIcon: true,
              postText: 'Congratulation! Awesome.',
              textColor: AppTheme.green,
              borderColor: AppTheme.green,
              bgColor: AppTheme.greenLight,
              iconColor: AppTheme.green,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
              text: 'New Quiz',
              size: 17.sp,
              textColor: AppTheme.black,
              textAlign: TextAlign.left,
            ),
            CustomFunction.customSpace(height: 10.h),
            Container(
              height: 150.h,
              decoration: const BoxDecoration(color: AppTheme.greyLight),
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
                          text: 'Logic', textColor: AppTheme.black),
                      CustomText(
                          text: '10 quiz',
                          textColor: AppTheme.black,
                          size: 11.sp),
                      CustomButton(
                          bgcolor: AppTheme.black,
                          text: 'Test Now ->',
                          fontSize: 12.sp,
                          onTap: () {
                            // CustomFunction.navigatePage(
                            //     QuizQuestionPage(), context);
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
          ],
        ));
  }
}
