import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DISCResultDetailPage extends StatelessWidget {
  const DISCResultDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'DISC Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFunction.customSpace(height: 10.h),
            CustomFunction.assetImage(
                image: 'images/di.png', width: 150.w, height: 130.h),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
              text: 'The Di Style ',
              size: 20.sp,
              textColor: AppTheme.black,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
              text:
                  'Di styles tend to be results-oriented, vocal, and enthusiastic,influencing others through their charm and bold action.\n\nTraits: dynamic, inquisitive, persuasive, rebellious, restless, entrepreneurial, results oriented, vocal, enthusiastic',
              size: 13.sp,
              textAlign: TextAlign.left,
              textColor: AppTheme.black,
            ),
            CustomFunction.customSpace(height: 20.h),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomText(
                size: 12.sp,
                text: 'See more...',
                textColor: AppTheme.orange,
              ),
            ),
            CustomFunction.customSpace(height: 90.h),
            const CustomResultContainer(
              isIcon: true,
              postText: 'Your DiSC Test will be expired at 24-Nov-2022',
              bgColor: AppTheme.orangeLight,
              textColor: AppTheme.orange,
              borderColor: AppTheme.orange,
              iconColor: AppTheme.orange,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomButton(
              text: 'Share Result',
              onTap: () {},
              bgcolor: AppTheme.black,
            )
          ],
        ),
      ),
    );
  }
}
