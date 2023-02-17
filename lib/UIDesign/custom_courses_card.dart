import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCourseCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? name;
  final String? cost;
  final String? time;
  final String? lessons;
  const CustomCourseCard(
      {super.key,
      this.image,
      this.title,
      this.name,
      this.cost,
      this.time,
      this.lessons});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 95.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5).r,
              color: AppTheme.greyLight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(width: 80.w, height: 80.h, child: Image.asset(image!)),
              Padding(
                padding: const EdgeInsets.all(8).w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      textColor: AppTheme.black,
                      size: 12.sp,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CustomText(
                            text: name,
                            textColor: AppTheme.blackLight,
                            size: 11.sp,
                          ),
                          CustomFunction.customSpace(width: 30.w),
                          CustomText(
                            text: cost,
                            textColor: AppTheme.orange,
                            size: 13.sp,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CustomText(
                              text: time,
                              textColor: AppTheme.blackLight,
                              size: 11.sp),
                          CustomFunction.customSpace(width: 20.w),
                          Icon(
                            Icons.circle,
                            color: AppTheme.orange,
                            size: 12.sp,
                          ),
                          CustomText(
                              text: '   $lessons',
                              textColor: AppTheme.blackLight,
                              size: 11.sp)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        CustomFunction.customSpace(height: 10.h)
      ],
    );
  }
}
