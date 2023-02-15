import 'package:coursia/UIDesign/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color? bgcolor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Icon? postFixIcon;
  final void Function()? onTap;

  const CustomButton(
      {super.key,
      required this.text,
      this.textColor,
      this.bgcolor,
      this.width,
      this.height,
      this.borderRadius,
      this.postFixIcon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: width ?? MediaQuery.of(context).size.width,
          height: height ?? 40.h,
          decoration: BoxDecoration(
              color: bgcolor ?? AppTheme.orange,
              borderRadius: BorderRadius.circular(borderRadius ?? 10.r)),
          child: Center(
            child: Text(
              text!,
              style: TextStyle(
                  color: textColor ?? AppTheme.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp),
            ),
          ),
        ));
  }
}
