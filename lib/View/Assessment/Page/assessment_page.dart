// ignore_for_file: must_be_immutable

import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/assessment_card.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Assignment/Page/assignment_question_page.dart';
import 'package:coursia/View/Blog/Page/blog_detail_page.dart';
import 'package:coursia/View/Case_Study/Page/case_study_question_page.dart';
import 'package:coursia/View/Competency/Page/competency_question_page.dart';
import 'package:coursia/View/Competency/bloc/competency_bloc.dart';
import 'package:coursia/View/DISC/Page/disc_question_page.dart';
import 'package:coursia/View/DISC/bloc/disc_bloc.dart';
import 'package:coursia/View/Evaluation/Page/evaluation_question_page.dart';
import 'package:coursia/View/IQ/Page/iq_question_page.dart';
import 'package:coursia/View/IQ/bloc/iq_bloc.dart';
import 'package:coursia/View/Multiple_Choice/Page/multiple_choice_question_page.dart';
import 'package:coursia/View/Quiz/Page/quiz_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssessmentPage extends StatelessWidget {
  AssessmentPage({super.key});
  List<DISCQuestionModel> discQuestionList = [];
  List<IQQuestionModel> iqQuestionList = [];
  List<CompetencyQuestionModel> competencyQuestionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(15.0).w,
        child: Column(
          children: [
            BlocConsumer<DISCBloc, DISCState>(
              listener: (context, state) {
                if (state is GetDISCQuestionListFailed) {
                  CustomFunction.flushBar(state.message.toString(), context);
                }
              },
              builder: (context, state) {
                if (state is GetDISCQuestionListSuccess) {
                  discQuestionList = state.discQuestionList;
                  Future.delayed(Duration.zero, () {
                    CustomFunction.navigatePage(
                        DISCQuestionPage(
                          discQuestionList: discQuestionList,
                          discQuestionModel: discQuestionList[0],
                          index: 0,
                          listLength: discQuestionList.length,
                          tapIndex: -1,
                        ),
                        context);
                  });
                }
                return AssessmentCard(
                  isDISC: true,
                  titleText: 'DiSC Personality Test',
                  bodyText: 'Know your DiSC Type, Strength and\nWeakness',
                  bgColor: const Color.fromARGB(255, 203, 231, 249),
                  btnColor: const Color(0xff407BFF),
                  onTap: () {
                    context
                        .read<DISCBloc>()
                        .add(const GetDISCQuestionListEvent());
                  },
                );
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            BlocConsumer<CompetencyBloc, CompetencyState>(
              listener: (context, state) {
                if (state is GetCompetencyQuestionListFailed) {
                  CustomFunction.flushBar(state.message.toString(), context);
                }
              },
              builder: (context, state) {
                if (state is GetCompetencyQuestionListSuccess) {
                  competencyQuestionList = state.competencyQuestionList;
                  Future.delayed(Duration.zero, () {
                    CustomFunction.navigatePage(
                        CompetencyQuestionPage(
                          competencyQuestionList: competencyQuestionList,
                          competencyQuestionModel: competencyQuestionList[0],
                          index: 0,
                          listLength: competencyQuestionList.length,
                          tapIndex: -1,
                        ),
                        context);
                  });
                }
                return AssessmentCard(
                  titleText: 'Competency Test',
                  bodyText: 'Know your Skill of Level to work',
                  bgColor: const Color.fromARGB(255, 233, 215, 249),
                  btnColor: const Color(0xffB256FA),
                  onTap: () {
                    context
                        .read<CompetencyBloc>()
                        .add(const GetCompetencyQuestionListEvent());
                    // CustomFunction.navigatePage(CompetencyQuestionPage(), context);
                  },
                );
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            BlocConsumer<IqBloc, IQState>(
              listener: (context, state) {
                if (state is GetIQQuestionListFailed) {
                  CustomFunction.flushBar(state.message.toString(), context);
                }
              },
              builder: (context, state) {
                if (state is GetIQQuestionListSuccess) {
                  iqQuestionList = state.iqQuestionList;
                  Future.delayed(Duration.zero, () {
                    CustomFunction.navigatePage(
                        IqQuestionPage(
                          iqQuestionList: iqQuestionList,
                          iqQuestionModel: iqQuestionList[0],
                          index: 0,
                          listLength: iqQuestionList.length,
                        ),
                        context);
                  });
                }
                return AssessmentCard(
                  titleText: 'iQTest',
                  bodyText: 'Know your iQ level and brain perception',
                  bgColor: const Color.fromARGB(255, 221, 242, 224),
                  btnColor: const Color(0xff0BAF25),
                  onTap: () {
                    context.read<IqBloc>().add(const GetIQQuestionListEvent());
                  },
                );
              },
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'Quiz',
              bodyText: 'Know your general knowledge for fun',
              bgColor: const Color.fromARGB(255, 247, 234, 219),
              btnColor: AppTheme.orange,
              onTap: () {
                CustomFunction.navigatePage(QuizMainPage(), context);
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
