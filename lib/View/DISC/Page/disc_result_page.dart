import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/DISC/Page/disc_result_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DISCResultPage extends StatelessWidget {
  const DISCResultPage({super.key});

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
                image: 'images/disc.png', width: 150.w, height: 130.h),
            CustomFunction.customSpace(height: 20.h),
            const CustomText(
              text: 'Result Analysis',
              textColor: AppTheme.black,
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomResultContainer(
                onTap: () {
                  CustomFunction.navigatePage(
                      const DISCResultDetailPage(), context);
                },
                isIcon: false,
                preText: 'D, dominance',
                postText: '80%',
                bgColor: AppTheme.green),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'i, influence',
                postText: '10%',
                bgColor: AppTheme.red),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'S, Steadiness',
                postText: '7%',
                bgColor: AppTheme.purpleLight),
            CustomFunction.customSpace(height: 10.h),
            const CustomResultContainer(
                isIcon: false,
                preText: 'C, Conscientiousness',
                postText: '3%',
                bgColor: AppTheme.yellow),
            CustomFunction.customSpace(height: 50.h),
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
