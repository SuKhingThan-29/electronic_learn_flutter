import 'dart:developer';

import 'package:coursia/View/Auth/Page/forget_password_page.dart';
import 'package:coursia/View//Auth/Page/signup_page.dart';
import 'package:coursia/View//Home/Page/home_page.dart';
import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  bool obscuretext = true;
  final formKey = GlobalKey<FormState>();
  String? token;

  @override
  void initState() {
    super.initState();

    // getToken();
  }

  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  getToken() async {
    FirebaseMessaging.instance.getToken().then(
          (value) => setState(
            () {
              token = value;
              log(token.toString());
            },
          ),
        );

    // FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  toggle() {
    setState(() {
      obscuretext = !obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
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
                text: 'Login',
                size: 30,
              ),
              CustomFunction.customSpace(height: 30),
              const CustomText(textAlign: TextAlign.left, text: 'Email'),
              CustomFunction.customSpace(height: 10),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                isEmail: true,
                isProfile: false,
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
                suffixIcon: IconButton(
                  icon: obscuretext
                      ? const Icon(Icons.visibility_off, color: AppTheme.grey)
                      : const Icon(Icons.visibility, color: AppTheme.orange),
                  onPressed: () {
                    toggle();
                  },
                ),
              ),
              CustomFunction.customSpace(height: 15),
              InkWell(
                onTap: () {
                  CustomFunction.navigatePage(
                      const ForgetPasswordPage(), context);
                },
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(text: 'Forget Passcode?', size: 12)),
              ),
              CustomFunction.customSpace(height: 15),
              CustomButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    CustomFunction.navigatePage(const HomePage(), context);
                    // if (formKey.currentState!.validate()) {
                    //   if (EmailValidator.validate(emailController.text)) {
                    //     CustomFunction.navigatePage(
                    //         const SignUpPage(), context);
                    //   } else {
                    //     CustomFunction.flushBar(
                    //         'Your email address is wrong!', context,
                    //         msgColor: AppTheme.red);
                    //   }
                    // }
                  },
                  text: 'Log in'),
              CustomFunction.customSpace(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        text: 'Don\'t have an account?',
                        size: 12,
                        textColor: AppTheme.grey),
                    InkWell(
                      onTap: () {
                        CustomFunction.navigatePage(
                            const SignUpPage(), context);
                      },
                      child: const CustomText(
                          text: ' Sign Up',
                          size: 14,
                          textColor: AppTheme.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
