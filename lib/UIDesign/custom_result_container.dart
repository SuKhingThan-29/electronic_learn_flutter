import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomResultContainer extends StatelessWidget {
  final String? preText;
  final String? postText;
  final Color? bgColor;
  final bool? isIcon;
  final void Function()? onTap;
  const CustomResultContainer(
      {super.key,
      this.preText,
      this.postText,
      this.bgColor,
      this.isIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          border: isIcon! ? Border.all(color: AppTheme.orange) : null,
          color: bgColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(children: [
            Expanded(
              child: isIcon!
                  ? const Icon(Icons.check_circle)
                  : CustomText(
                      text: preText,
                      textAlign: TextAlign.left,
                    ),
            ),
            CustomText(
              text: postText,
              size: 12.sp,
              textColor: isIcon! ? AppTheme.orange : AppTheme.white,
            ),
          ]),
        ),
      ),
    );
  }
}
