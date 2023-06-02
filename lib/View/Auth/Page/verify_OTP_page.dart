// ignore_for_file: file_names, must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/otp_input.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/View/Auth/Page/signup_page.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyOTPPage extends StatelessWidget {
  String? userName;
  String? email;
  VerifyOTPPage({super.key, required this.userName, required this.email});

  final TextEditingController _fieldOne = TextEditingController();

  final TextEditingController _fieldTwo = TextEditingController();

  final TextEditingController _fieldThree = TextEditingController();

  final TextEditingController _fieldFour = TextEditingController();

  final TextEditingController _fieldFive = TextEditingController();

  String? verifyCode;
  bool? isTimeOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SendOTPSuccess) {
            if (state.otpVerifyResponseModel!.success == true) {
              FocusManager.instance.primaryFocus?.unfocus();
              CustomFunction.navigatePage(SignUpPage(), context);
            } else if (state.otpVerifyResponseModel!.success == false) {
              CustomFunction.flushBar(
                  state.otpVerifyResponseModel!.message, context,
                  msgColor: AppTheme.red);
            }
          }
          if (state is SendOTPFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
          if (state is EmailVerificationSuccess) {
            if (state.emailVerifyResponseModel!.success == true) {
              CustomFunction.navigatePage(
                  VerifyOTPPage(
                    userName: userName,
                    email: email,
                  ),
                  context);
            }
            if (state.emailVerifyResponseModel!.success == false) {
              CustomFunction.flushBar(
                  state.emailVerifyResponseModel!.message, context,
                  msgColor: AppTheme.red);
            }
          }
          if (state is EmailVerificationFailed) {
            CustomFunction.flushBar(state.message, context,
                msgColor: AppTheme.red);
          }
        },
        builder: (context, state) {
          if (state is SendOTPLoading || state is EmailVerificationLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppTheme.orange,
              ),
            );
          }

          return SingleChildScrollView(
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
                CustomText(
                  textAlign: TextAlign.left,
                  text: 'A 5-digits code has been send to\n$email',
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
                CustomFunction.customSpace(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    width: 60.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: AppTheme.orange,
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Countdown(
                        seconds: 180,
                        build: (BuildContext context, double time) =>
                            CustomText(
                          text: '$time s',
                          textColor: AppTheme.white,
                        ),
                        interval: const Duration(milliseconds: 100),
                        onFinished: () {
                          isTimeOut = true;
                          CustomFunction.flushBar(
                              'Time Out! \nPlease click resend code.', context,
                              msgColor: AppTheme.red);
                        },
                      ),
                    ),
                  ),
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
                      if (verifyCode!.length >= 5) {
                        // CustomFunction.navigatePage(ResetPasswordPage(), context);
                        // CustomFunction.navigatePage(SignUpPage(), context);
                        isTimeOut!
                            ? CustomFunction.flushBar(
                                'Time Out! \nPlease click resend code.',
                                context,
                                msgColor: AppTheme.red)
                            : context.read<AuthBloc>().add(SendOTP(
                                name: userName, email: email, otp: verifyCode));
                      } else {
                        context.read<AuthBloc>().add(
                            EmailVerification(name: userName, email: email));
                      }
                    },
                    text: 'Submit'),
                CustomFunction.customSpace(height: 30),
                Center(
                  child: InkWell(
                    onTap: () {
                      if (isTimeOut == true) {
                        context.read<AuthBloc>().add(
                            EmailVerification(name: userName, email: email));
                      } else {
                        CustomFunction.flushBar(
                            'Your OTP code is valid. Please fill your code carefully.',
                            context,
                            msgColor: AppTheme.red);
                      }
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
          ));
        },
      ),
    );
  }
}
