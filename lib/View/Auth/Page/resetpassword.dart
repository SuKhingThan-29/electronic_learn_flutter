// ignore_for_file: file_names

import 'package:coursia/UIDesign/apptheme.dart';
import 'package:coursia/UIDesign/button_design.dart';
import 'package:coursia/UIDesign/coursia_top_image.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/UIDesign/text_design.dart';
import 'package:coursia/UIDesign/textform_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
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
              CustomFunction.customSpace(height: 80),
              const CustomText(
                textAlign: TextAlign.left,
                text: 'Reset\nPasscode?',
                size: 30,
              ),
              CustomFunction.customSpace(height: 30),
              const CustomText(
                text: 'Enter new passcode.',
                size: 12,
                textColor: AppTheme.grey,
                fontWeight: FontWeight.bold,
              ),
              CustomFunction.customSpace(height: 30),
              const CustomText(textAlign: TextAlign.left, text: 'Passcode'),
              CustomFunction.customSpace(height: 10),
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
              CustomFunction.customSpace(height: 15),
              const CustomText(
                  textAlign: TextAlign.left, text: 'Confirm Passcode'),
              CustomFunction.customSpace(height: 10),
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
              CustomFunction.customSpace(height: 30),
              CustomButton(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      if (pwController.text == confirmPwController.text) {
                        // CustomFunction.navigatePage(
                        //     const SignUpPage(), context);
                      } else {
                        CustomFunction.flushBar(
                            'Your password and confirm password are not match!',
                            context,
                            msgColor: AppTheme.red);
                      }
                    }
                  },
                  text: 'Confirm'),
            ],
          ),
        ),
      )),
    );
  }
}
