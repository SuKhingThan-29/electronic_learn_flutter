// ignore_for_file: file_names

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/View/Auth/Page/verify_OTP_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpEmailPage extends StatelessWidget {
  SignUpEmailPage({super.key});

  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).w,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: CoursiaTopImage()),
              CustomFunction.customSpace(height: 80),
              const CustomText(
                textAlign: TextAlign.left,
                text: 'Sign Up\nwith your email\naddress',
                size: 30,
              ),
              CustomFunction.customSpace(height: 30),
              const CustomText(
                text: 'Enter email to register your account.',
                size: 12,
                textColor: AppTheme.grey,
                fontWeight: FontWeight.bold,
              ),
              CustomFunction.customSpace(height: 30),
              const CustomText(textAlign: TextAlign.left, text: 'Email'),
              CustomFunction.customSpace(height: 10),
              CustomTextFormField(
                isProfile: false,
                controller: emailController,
                hintText: 'Email',
                textColor: AppTheme.white,
                isEmail: true,
              ),
              CustomFunction.customSpace(height: 30),
              CustomButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    CustomFunction.navigatePage(VerifyOTPPage(), context);
                    // if (formKey.currentState!.validate()) {
                    // if (EmailValidator.validate(emailController.text)) {
                    //   CustomFunction.navigatePage(
                    //       const SignUpPage(), context);
                    // } else {
                    //   CustomFunction.flushBar(
                    //       'Your email address is wrong!', context,
                    //       msgColor: AppTheme.red);
                    // }
                    // }
                  },
                  text: 'Request OTP'),
            ],
          ),
        ),
      )),
    );
  }
}
