// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_answer_container.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/DISC/Page/disc_result_page.dart';
import 'package:coursia/View/DISC/bloc/disc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DISCQuestionPage extends StatelessWidget {
  DISCQuestionPage({super.key});
  List answerList = [
    {"id": 0, "name": "Alfred Nobel"},
    {"id": 1, "name": "Albert Einstein"},
    {"id": 2, "name": "Donna Strickland"},
    {"id": 3, "name": "Isamu Akasaki"}
  ];

  int? onTapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'DISC Test', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<DiscBloc, DiscState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OnTapSuccess) {
          onTapIndex = state.onTapIndex!;
        }
        return Padding(
          padding: EdgeInsets.all(15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFunction.customSpace(height: 20.h),
              const CustomText(
                text: 'Question 1/10',
                textColor: AppTheme.orange,
              ),
              CustomFunction.customSpace(height: 40.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: answerList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomAnswerContainer(
                          text: answerList[index]["name"],
                          index: index,
                          currentIndex: onTapIndex,
                          onTap: () {
                            context
                                .read<DiscBloc>()
                                .add(OnTapEvent(onTapIndex: index));
                          },
                        ),
                        CustomFunction.customSpace(height: 10)
                      ],
                    );
                  },
                ),
              ),
              // CustomButton(
              //   onTap: () {},
              //   text: 'Next',
              //   textColor: AppTheme.white,
              //   bgcolor: onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: 150.w,
                    onTap: () {},
                    text: 'Previous',
                    textColor: AppTheme.white,
                    bgcolor:
                        onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                  ),
                  CustomButton(
                    width: 150.w,
                    onTap: () {
                      CustomFunction.navigatePage(
                          const DISCResultPage(), context);
                    },
                    text: 'Next',
                    textColor: AppTheme.white,
                    bgcolor:
                        onTapIndex != -1 ? AppTheme.black : AppTheme.greyDark,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // InkWell customanswercontainer(BuildContext context, int index) {
  //   return InkWell(
  //     onTap: () {
  //       context.read<DiscBloc>().add(OnTapEvent(onTapIndex: index));
  //     },
  //     child: Container(
  //       height: 60.h,
  //       decoration: BoxDecoration(
  //           color: onTapIndex == index ? AppTheme.orange : AppTheme.greyLight,
  //           borderRadius: BorderRadius.circular(5.r)),
  //       child: Row(children: [
  //         SizedBox(
  //           width: 100.w,
  //           child: onTapIndex == index
  //               ? const Icon(
  //                   Icons.album,
  //                   color: AppTheme.white,
  //                 )
  //               : const Icon(
  //                   Icons.circle_outlined,
  //                   color: AppTheme.greyDark,
  //                 ),
  //         ),
  //         CustomText(
  //           text: customerRecontractReason[index]["name"],
  //           textColor: onTapIndex == index ? AppTheme.white : AppTheme.greyDark,
  //         )
  //       ]),
  //     ),
  //   );
  // }
}
