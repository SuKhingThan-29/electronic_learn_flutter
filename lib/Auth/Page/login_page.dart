import 'package:coursia/Auth/Page/forgetPassword_page.dart';
import 'package:coursia/Auth/Page/signup_page.dart';
import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/button_design.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/text_design.dart';
import 'package:coursia/UIDesign/textform_design.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
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
              CustomFunction.customSpace(80),
              const CustomText(
                textAlign: TextAlign.left,
                text: 'Login',
                size: 30,
              ),
              CustomFunction.customSpace(30),
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
              InkWell(
                onTap: () {
                  CustomFunction.navigatePage(
                      const ForgetPasswordPage(), context);
                },
                child: const Align(
                    alignment: Alignment.centerRight,
                    child: CustomText(text: 'Forget Passcode?', size: 12)),
              ),
              CustomFunction.customSpace(15),
              CustomButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      if (EmailValidator.validate(emailController.text)) {
                        CustomFunction.navigatePage(
                            const SignUpPage(), context);
                      } else {
                        CustomFunction.flushBar(
                            'Your email address is wrong!', context,
                            msgColor: AppTheme.red);
                      }
                    }
                  },
                  text: 'Log in'),
              CustomFunction.customSpace(15),
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
