import 'package:another_flushbar/flushbar.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFunction {
  static navigatePage(Widget? page, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page!));
  }

  static customSpace(double? height) {
    return SizedBox(height: height!.h);
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
}
