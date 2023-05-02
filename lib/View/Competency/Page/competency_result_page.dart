import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_compe_result_indicator.dart';
import 'package:coursia/UIDesign/custom_courses_card.dart';
import 'package:coursia/UIDesign/custom_result_container.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompetencyResultPage extends StatelessWidget {
  const CompetencyResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(
        text: 'Competency Test Result', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            CustomFunction.customSpace(height: 10.h),
            CustomCompeResultIndicator(
              text: 'Leadership',
              percentText: '90%',
              indicatorColor: AppTheme.orange,
              percent: 0.9,
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomCompeResultIndicator(
              text: 'Problem Solving',
              percentText: '70%',
              indicatorColor: const Color.fromARGB(255, 230, 157, 73),
              percent: 0.7,
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomCompeResultIndicator(
              text: 'Critical Thinking',
              percentText: '50%',
              indicatorColor: const Color.fromARGB(255, 221, 176, 125),
              percent: 0.5,
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomCompeResultIndicator(
              text: 'Empowering Other',
              percentText: '45%',
              indicatorColor: const Color.fromARGB(255, 226, 188, 145),
              percent: 0.45,
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomCompeResultIndicator(
              text: 'Coaching',
              percentText: '40%',
              indicatorColor: const Color.fromARGB(255, 224, 196, 165),
              percent: 0.4,
            ),
            CustomFunction.customSpace(height: 40.h),
            CustomCompeResultIndicator(
              text: 'Analysis',
              percentText: '30%',
              indicatorColor: const Color.fromARGB(255, 223, 210, 195),
              percent: 0.3,
            ),
            CustomFunction.customSpace(height: 40.h),
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
            ),
            CustomFunction.customSpace(height: 20.h),
            CustomText(
              text: 'Suggested Courses',
              textColor: AppTheme.black,
              textAlign: TextAlign.left,
              size: 17.sp,
            ),
            CustomFunction.customSpace(height: 20.h),
            const CustomCourseCard(
                isCart: false,
                isWishlist: false,
                isLearning: false,
                isCertificate: false,
                image: 'images/pana1.png',
                title: 'Data Visualization with R Language',
                name: 'Joni Iskandar',
                cost: '\$450',
                time: '1h 35m ',
                lessons: '17 Lessons')
          ],
        ));
  }
}
