import 'package:another_flushbar/flushbar.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/View/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFunction {
  static navigatePage(Widget? page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
  }

  static customSpace(
      {double? width = double.infinity, double? height = double.infinity}) {
    return SizedBox(height: height!.h, width: width!.w);
  }

  static flushBar(String? message, BuildContext context,
      {Color? msgColor = AppTheme.black, Color? bgColor = AppTheme.white}) {
    return Flushbar(
      messageColor: msgColor ?? AppTheme.black,
      backgroundColor: bgColor ?? AppTheme.white,
      duration: const Duration(seconds: 3),
      flushbarPosition: FlushbarPosition.TOP,
      //title: title,
      message: message,
    )..show(context);
  }

  static appBar(BuildContext context, {String? username}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Hello , $username', size: 20),
          const SizedBox(height: 20),
          const CustomText(text: 'What do you want to learn today?')
        ],
      ),
      actions: [
        Row(
          children: [
            Image.asset('images/Vector.png', width: 30.sp, height: 30.sp),
            SizedBox(width: 10.w),
            InkWell(
                child:
                    Image.asset('images/boy.png', width: 40.sp, height: 40.sp),
                onTap: () {
                  navigatePage(const ProfilePage(), context);
                }),
            SizedBox(width: 5.w),
          ],
        )
      ],
      toolbarHeight: 120.h,
      backgroundColor: AppTheme.black,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
      ),
    );
  }

  static customBody(BuildContext context,
      {bool? isProfile, Padding? columnData}) {
    return Stack(
      children: [
        Container(height: 700.h, color: AppTheme.black),
        Positioned(
          top: isProfile! ? 35.h : 10.h,
          child: Container(
            height: 700.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30.r))),
            child: columnData,
          ),
        ),
        isProfile
            ? Positioned.fill(
                top: 10.h,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('images/boy.png',
                      width: 60.sp, height: 60.sp),
                ))
            : Container(),
      ],
    );
  }

  static assetImage({String? image, double? height, double? width}) {
    return Image.asset(
      image!,
      width: width ?? 150.w,
      height: height ?? 30.h,
      fit: BoxFit.fill,
    );
  }
}
