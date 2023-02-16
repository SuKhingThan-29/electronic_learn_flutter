// ignore_for_file: file_names
import 'package:coursia/View//Auth/Page/resetpassword.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/button_design.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/otpinput.dart';
import 'package:coursia/UIDesign/text_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyOTPPage extends StatefulWidget {
  const VerifyOTPPage({super.key});

  @override
  State<VerifyOTPPage> createState() => _VerifyOTPPageState();
}

class _VerifyOTPPageState extends State<VerifyOTPPage> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();

  String? verifyCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: CoursiaTopImage()),
            CustomFunction.customSpace(height: 80),
            const CustomText(
              textAlign: TextAlign.left,
              text: 'Enter\nOTP',
              size: 30,
            ),
            CustomFunction.customSpace(height: 30),
            const CustomText(
              textAlign: TextAlign.left,
              text: 'A 5-digits code has been send to\na**********apple.com',
              size: 12,
              textColor: AppTheme.grey,
              fontWeight: FontWeight.bold,
            ),
            CustomFunction.customSpace(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true), // auto focus
                OtpInput(_fieldTwo, false),
                OtpInput(_fieldThree, false),
                OtpInput(_fieldFour, false),
                OtpInput(_fieldFive, false)
              ],
            ),
            CustomFunction.customSpace(height: 30),
            CustomButton(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  verifyCode = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text +
                      _fieldFive.text;
                  //log(verifyCode.toString());
                  if (verifyCode!.length >= 5) {
                    CustomFunction.navigatePage(
                        const ResetPasswordPage(), context);
                  } else {
                    CustomFunction.flushBar(
                        'Please enter completely verify code!', context,
                        msgColor: AppTheme.red);
                  }
                },
                text: 'Submit'),
            CustomFunction.customSpace(height: 30),
            Center(
              child: InkWell(
                onTap: () {
                  // CustomFunction.navigatePage(
                  //     const SignUpPage(), context);
                },
                child: const CustomText(
                    text: ' Resend Code',
                    size: 14,
                    textColor: AppTheme.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
