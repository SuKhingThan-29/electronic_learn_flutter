import 'package:coursia/Auth/Page/login_page.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/button_design.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/text_design.dart';
import 'package:coursia/UIDesign/textform_design.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();
  bool obscuretext = true;
  bool obscuretext1 = true;

  toggle() {
    setState(() {
      obscuretext = !obscuretext;
    });
  }

  toggle1() {
    setState(() {
      obscuretext1 = !obscuretext1;
    });
  }

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
              CustomFunction.customSpace(60),
              const CustomText(
                textAlign: TextAlign.left,
                text: 'Sign Up',
                size: 30,
              ),
              CustomFunction.customSpace(30),
              const CustomText(textAlign: TextAlign.left, text: 'Username'),
              CustomFunction.customSpace(10),
              CustomTextFormField(
                controller: userNameController,
                hinttext: 'Username',
                isEmail: false,
              ),
              CustomFunction.customSpace(15),
              const CustomText(textAlign: TextAlign.left, text: 'Email'),
              CustomFunction.customSpace(10),
              CustomTextFormField(
                controller: emailController,
                hinttext: 'Email',
                isEmail: true,
              ),
              CustomFunction.customSpace(15),
              const CustomText(textAlign: TextAlign.left, text: 'Passcode'),
              CustomFunction.customSpace(10),
              CustomTextFormField(
                controller: pwController,
                obscureText: obscuretext,
                isEmail: false,
                hinttext: 'Passcode',
                suffixicon: IconButton(
                  icon: obscuretext
                      ? const Icon(Icons.visibility_off, color: AppTheme.grey)
                      : const Icon(Icons.visibility, color: AppTheme.orange),
                  onPressed: () {
                    toggle();
                  },
                ),
              ),
              CustomFunction.customSpace(15),
              const CustomText(
                  textAlign: TextAlign.left, text: 'Confirm Passcode'),
              CustomFunction.customSpace(10),
              CustomTextFormField(
                controller: confirmPwController,
                obscureText: obscuretext1,
                isEmail: false,
                hinttext: 'Confirm Passcode',
                suffixicon: IconButton(
                  icon: obscuretext1
                      ? const Icon(Icons.visibility_off, color: AppTheme.grey)
                      : const Icon(Icons.visibility, color: AppTheme.orange),
                  onPressed: () {
                    toggle1();
                  },
                ),
              ),
              CustomFunction.customSpace(40),
              CustomButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      if (EmailValidator.validate(emailController.text)) {
                        if (pwController.text == confirmPwController.text) {
                          CustomFunction.navigatePage(
                              const SignUpPage(), context);
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
              CustomFunction.customSpace(15),
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
                        CustomFunction.navigatePage(const LoginPage(), context);
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
            ],
          ),
        ),
      )),
    );
  }
}
