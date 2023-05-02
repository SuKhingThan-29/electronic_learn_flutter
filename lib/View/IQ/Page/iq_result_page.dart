import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_iq_result_detail.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IQResultPage extends StatelessWidget {
  const IQResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'iQ Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFunction.customSpace(height: 10.h),
            CustomResultContainer(
                onTap: () {
                  // CustomFunction.navigatePage(
                  //     const DISCResultDetailPage(), context);
                },
                isIcon: false,
                preText: 'CL',
                postText: '20%',
                bgColor: AppTheme.red),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'LR',
                postText: '17%',
                bgColor: AppTheme.yellow),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'LT',
                postText: '10%',
                bgColor: AppTheme.green),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'PS',
                postText: '10%',
                bgColor: AppTheme.navy),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'NA',
                postText: '9%',
                bgColor: AppTheme.purpleLight),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'TA',
                postText: '9%',
                bgColor: AppTheme.navyLight),
            CustomFunction.customSpace(height: 30.h),
            const CustomIQResultDetail(
              circleText: 'CL',
              titleText: 'Creative Logic',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.red,
              titleColor: AppTheme.red,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomIQResultDetail(
              circleText: 'LR',
              titleText: 'Logical Reasoning',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.yellow,
              titleColor: AppTheme.yellow,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomIQResultDetail(
              circleText: 'LT',
              titleText: 'Lateral Thinking',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.green,
              titleColor: AppTheme.green,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomIQResultDetail(
              circleText: 'PS',
              titleText: 'Problem Solving',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.navy,
              titleColor: AppTheme.navy,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomIQResultDetail(
              circleText: 'NA',
              titleText: 'Numerical Aptitude',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.purpleLight,
              titleColor: AppTheme.purpleLight,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomIQResultDetail(
              circleText: 'TA',
              titleText: 'Technical Aptitude',
              bodyText:
                  'Requires logic, together with a high degree of spatial awareness and creative thinking, and flexibility of mind in adapting to different types of questions.',
              leadTextColor: AppTheme.navyLight,
              titleColor: AppTheme.navyLight,
            ),
            CustomFunction.customSpace(height: 50.h),
            const CustomResultContainer(
              isIcon: true,
              postText: 'Your iQ Test will be expired at 24-Nov-2022',
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
