import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/assessmentcard.dart';
import 'package:coursia/UIDesign/function.dart';
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
              onTap: () {},
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'Competency Test',
              bodyText: 'Know your Skill of Level to work',
              bgColor: const Color.fromARGB(255, 233, 215, 249),
              btnColor: const Color(0xffB256FA),
              onTap: () {},
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'iQTest',
              bodyText: 'Know your iQ level and brain perception',
              bgColor: const Color.fromARGB(255, 221, 242, 224),
              btnColor: const Color(0xff0BAF25),
              onTap: () {},
            ),
            CustomFunction.customSpace(height: 10.h),
            AssessmentCard(
              titleText: 'Quiz',
              bodyText: 'Know your general knowledge for fun',
              bgColor: const Color.fromARGB(255, 247, 234, 219),
              btnColor: AppTheme.orange,
              onTap: () {},
            )
          ],
        ),
      )),
    );
  }
}
