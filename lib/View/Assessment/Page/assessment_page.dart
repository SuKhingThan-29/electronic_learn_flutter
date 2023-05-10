import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/assessment_card.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assignment/Page/assignment_question_page.dart';
import 'package:coursia/View/Blog/Page/blog_detail_page.dart';
import 'package:coursia/View/Case_Study/Page/case_study_question_page.dart';
import 'package:coursia/View/Competency/Page/competency_question_page.dart';
import 'package:coursia/View/Courses/Page/courses_detail_page.dart';
import 'package:coursia/View/DISC/Page/disc_question_page.dart';
import 'package:coursia/View/Evaluation/Page/evaluation_question_page.dart';
import 'package:coursia/View/IQ/Page/iq_question_page.dart';
import 'package:coursia/View/Multiple_Choice/Page/multiple_choice_question_page.dart';
import 'package:coursia/View/Quiz/Page/quiz_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssessmentPage extends StatelessWidget {
  const AssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Column(
          children: [
            AssessmentCard(
              isDISC: true,
              titleText: 'DiSC Personality Test',
              bodyText: 'Know your DiSC Type, Strength and\nWeakness',
              bgColor: const Color.fromARGB(255, 203, 231, 249),
              btnColor: const Color(0xff407BFF),
              onTap: () {
                CustomFunction.navigatePage(DISCQuestionPage(), context);
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'Competency Test',
              bodyText: 'Know your Skill of Level to work',
              bgColor: const Color.fromARGB(255, 233, 215, 249),
              btnColor: const Color(0xffB256FA),
              onTap: () {
                CustomFunction.navigatePage(CompetencyQuestionPage(), context);
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'iQTest',
              bodyText: 'Know your iQ level and brain perception',
              bgColor: const Color.fromARGB(255, 221, 242, 224),
              btnColor: const Color(0xff0BAF25),
              onTap: () {
                CustomFunction.navigatePage(IqQuestionPage(), context);
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'Quiz',
              bodyText: 'Know your general knowledge for fun',
              bgColor: const Color.fromARGB(255, 247, 234, 219),
              btnColor: AppTheme.orange,
              onTap: () {
                CustomFunction.navigatePage(const QuizMainPage(), context);
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            CustomButton(
                bgcolor: AppTheme.orange,
                text: 'Blog',
                fontSize: 12.sp,
                onTap: () {
                  CustomFunction.navigatePage(BlogDetailPage(), context);
                },
                width: 90.w,
                height: 25.h,
                borderRadius: 20.r),
            CustomFunction.customSpace(height: 10.h),
            CustomButton(
                bgcolor: AppTheme.orange,
                text: 'Assignment',
                fontSize: 12.sp,
                onTap: () {
                  CustomFunction.navigatePage(
                      const AssignmentQuestionPage(), context);
                },
                width: 90.w,
                height: 25.h,
                borderRadius: 20.r),
            CustomFunction.customSpace(height: 10.h),
            CustomButton(
                bgcolor: AppTheme.orange,
                text: 'Multiple Choice',
                fontSize: 12.sp,
                onTap: () {
                  CustomFunction.navigatePage(
                      MultipleChoiceQuestionPage(), context);
                },
                width: 90.w,
                height: 25.h,
                borderRadius: 20.r),
            CustomFunction.customSpace(height: 10.h),
            CustomButton(
                bgcolor: AppTheme.orange,
                text: 'Case Study',
                fontSize: 12.sp,
                onTap: () {
                  CustomFunction.navigatePage(CaseStudyQuestionPage(), context);
                },
                width: 90.w,
                height: 25.h,
                borderRadius: 20.r),
            CustomFunction.customSpace(height: 10.h),
            CustomButton(
                bgcolor: AppTheme.orange,
                text: 'Evaluation',
                fontSize: 12.sp,
                onTap: () {
                  CustomFunction.navigatePage(
                      EvaluationQuestionPage(), context);
                },
                width: 90.w,
                height: 25.h,
                borderRadius: 20.r),
            CustomFunction.customSpace(height: 10.h),
            // CustomButton(
            //     bgcolor: AppTheme.orange,
            //     text: 'Video player',
            //     fontSize: 12.sp,
            //     onTap: () {
            //       CustomFunction.navigatePage(CourseDetialPage(), context);
            //     },
            //     width: 90.w,
            //     height: 25.h,
            //     borderRadius: 20.r)
          ],
        ),
      )),
    );
  }
}
