// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDetailPage extends StatelessWidget {
  BlogDetailPage({super.key});

  int? onTapIndex = -1;
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Blog', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            children: [
              const CustomText(
                  text: 'Traveling',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.left),
              CustomFunction.customSpace(height: 20.h),
              Image.asset(
                'images/travel.png',
                height: 150.h,
                fit: BoxFit.contain,
              ),
              CustomFunction.customSpace(height: 20.h),
              const CustomText(
                  text: 'A while back, we were travelling in London.',
                  textColor: AppTheme.black,
                  size: 20,
                  textAlign: TextAlign.left),
              CustomFunction.customSpace(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(
                      text: 'July-24, 2022',
                      textColor: AppTheme.black,
                      textAlign: TextAlign.left),
                  CustomText(
                      text: 'Arkar Min Myat',
                      textColor: AppTheme.black,
                      fontWeight: FontWeight.bold,
                      size: 13,
                      textAlign: TextAlign.left),
                ],
              ),
              CustomFunction.customSpace(height: 20.h),
              const CustomText(
                  text:
                      '“Don’t worry, pretty lady. I’ll make sure to use a good, strong lock to keep the niggers out.”He smiled. I blinked. Fifteen years ago, I was moving into my third-floor condo in the French Quarter of New Orleans, Louisiana. I’d hired a neighborhood locksmith to re-key the locks.',
                  textColor: AppTheme.black,
                  size: 14,
                  textAlign: TextAlign.justify),
              CustomFunction.customSpace(height: 20.h),
              const Divider(
                color: AppTheme.black,
              ),
              CustomFunction.customSpace(height: 20.h),
              const CustomText(
                  text: 'Next Articles',
                  textColor: AppTheme.black,
                  textAlign: TextAlign.left),
              CustomFunction.customSpace(height: 20.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/travel2.png',
                              height: 100.h,
                              width: 120.w,
                              fit: BoxFit.contain,
                            ),
                            CustomFunction.customSpace(width: 5.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 130.w,
                                        child: const CustomText(
                                            text: 'Mindfulness',
                                            textColor: AppTheme.black,
                                            size: 12,
                                            textAlign: TextAlign.left),
                                      ),
                                      const CustomText(
                                          text: 'June-24,2022',
                                          textColor: AppTheme.black,
                                          size: 12,
                                          textAlign: TextAlign.left)
                                    ],
                                  ),
                                  CustomFunction.customSpace(height: 10.h),
                                  const CustomText(
                                      text:
                                          'Overcoming Procrastination:Why Mindfulness is The Key',
                                      textColor: AppTheme.black,
                                      textAlign: TextAlign.justify),
                                  CustomFunction.customSpace(height: 10.h),
                                  const CustomText(
                                      text: 'Nyi Nyi Htwe',
                                      textColor: AppTheme.black,
                                      fontWeight: FontWeight.bold,
                                      size: 12,
                                      textAlign: TextAlign.left)
                                ],
                              ),
                            )
                          ]),
                      CustomFunction.customSpace(height: 20.h),
                      const Divider(
                        color: AppTheme.grey,
                      ),
                      CustomFunction.customSpace(height: 20.h),
                    ],
                  );
                },
              ),
            ]));
  }
}
