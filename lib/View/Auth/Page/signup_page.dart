// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:coursia/UIDesign/custom_dropdown.dart';
import 'package:coursia/View//Auth/Page/login_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/View/Auth/bloc/auth_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Profile/bloc/profile_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();

  final emailController = TextEditingController();

  final pwController = TextEditingController();

  final confirmPwController = TextEditingController();

  bool obscuretext = true;

  bool obscuretext1 = true;

  final List<String> jobLevelList = ['Manager', 'Non-Manager', 'GA', 'Admin'];
  String? jobLevel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.black),
      backgroundColor: AppTheme.black,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is VisibilityOnOffSuccess) {
            obscuretext = state.obscureText!;
          }
          if (state is VisibilityOnOff1Success) {
            obscuretext1 = state.obscureText1!;
          }
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15).w,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: CoursiaTopImage()),
                  CustomFunction.customSpace(height: 60),
                  const CustomText(
                    textAlign: TextAlign.left,
                    text: 'Sign Up',
                    size: 30,
                  ),
                  CustomFunction.customSpace(height: 30),
                  const CustomText(textAlign: TextAlign.left, text: 'Username'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: userNameController,
                    hintText: 'Username',
                    isEmail: false,
                    textColor: AppTheme.white,
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(textAlign: TextAlign.left, text: 'Email'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: emailController,
                    hintText: 'Email',
                    isEmail: true,
                    textColor: AppTheme.white,
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(
                      textAlign: TextAlign.left, text: 'Job Level'),
                  CustomFunction.customSpace(height: 10),
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is GetDropDownValueSuccess) {
                        jobLevel = state.value;
                        // log(jobLevel.toString());
                      }
                      return CustomDropDown(
                        items: jobLevelList,
                        hintText: 'Job Level',
                        isSignUp: true,
                      );
                    },
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(textAlign: TextAlign.left, text: 'Passcode'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: pwController,
                    obscureText: obscuretext,
                    isEmail: false,
                    hintText: 'Passcode',
                    textColor: AppTheme.white,
                    suffixIcon: IconButton(
                      icon: obscuretext
                          ? const Icon(Icons.visibility_off,
                              color: AppTheme.grey)
                          : const Icon(Icons.visibility,
                              color: AppTheme.orange),
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(VisibilityOnOffEvent(!obscuretext));
                      },
                    ),
                  ),
                  CustomFunction.customSpace(height: 15),
                  const CustomText(
                      textAlign: TextAlign.left, text: 'Confirm Passcode'),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                    isProfile: false,
                    controller: confirmPwController,
                    obscureText: obscuretext1,
                    isEmail: false,
                    hintText: 'Confirm Passcode',
                    textColor: AppTheme.white,
                    suffixIcon: IconButton(
                      icon: obscuretext1
                          ? const Icon(Icons.visibility_off,
                              color: AppTheme.grey)
                          : const Icon(Icons.visibility,
                              color: AppTheme.orange),
                      onPressed: () {
                        context
                            .read<AuthBloc>()
                            .add(VisibilityOnOff1Event(!obscuretext1));
                      },
                    ),
                  ),
                  CustomFunction.customSpace(height: 40),
                ],
              ),
            ),
          ));
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CustomButton(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                  if (EmailValidator.validate(emailController.text)) {
                    if (pwController.text == confirmPwController.text) {
                      CustomFunction.navigatePage(SignUpPage(), context);
                    } else {
                      CustomFunction.flushBar(
                          'Your password and confirm password are not match!',
                          context,
                          msgColor: AppTheme.red);
                    }
                  } else {
                    CustomFunction.flushBar(
                        'Your email address is wrong!', context,
                        msgColor: AppTheme.red);
                  }
                }
              },
              text: 'Create Account'),
          CustomFunction.customSpace(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                    text: 'Already have an account?',
                    size: 12,
                    textColor: AppTheme.grey),
                InkWell(
                  onTap: () {
                    CustomFunction.navigatePage(LoginPage(), context);
                  },
                  child: const CustomText(
                      text: ' Log in',
                      size: 14,
                      textColor: AppTheme.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
