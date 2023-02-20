import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.black,
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: CustomFunction.customBody(context,
            isProfile: false, columnData: bodyData()));
  }

  bodyData() {
    return Padding(
      padding: EdgeInsets.all(15.w),
      // child: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   physics: const ScrollPhysics(),
      child: ListView(
        shrinkWrap: true,
        // scrollDirection: Axis.vertical,
        // physics: const ScrollPhysics(),
        children: [
          CustomFunction.customSpace(height: 40),
          Stack(
            children: <Widget>[
              SizedBox(
                  width: 120.w,
                  height: 120.h,
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Image.asset('images/boy.png',
                        width: 100.sp, height: 100.sp),
                  )),
              Positioned(
                  top: 70.h,
                  left: 80.w,
                  child: const CircleAvatar(
                    backgroundColor: AppTheme.orange,
                    child: Icon(
                      Icons.edit,
                      color: AppTheme.white,
                    ),
                  ))
            ],
          ),
          CustomFunction.customSpace(height: 10),
          CustomText(
            text: 'Arkar Min Myat',
            textColor: AppTheme.black,
            size: 17.sp,
          ),
          CustomFunction.customSpace(height: 10),
          CustomText(
            text: 'Data Engineer',
            textColor: AppTheme.grey,
            size: 12.sp,
          ),
          CustomFunction.customSpace(height: 10),
          CustomTextFormField(
              isProfile: true,
              controller: emailController,
              isEmail: false,
              hintText: 'Email Address'),
          CustomFunction.customSpace(height: 20),
          CustomTextFormField(
              isProfile: true,
              controller: userNameController,
              isEmail: false,
              hintText: 'Username'),
          CustomFunction.customSpace(height: 20),
          CustomTextFormField(
              isProfile: true,
              obscureText: obscureText,
              controller: passwordController,
              isEmail: false,
              hintText: 'Password'),
          CustomFunction.customSpace(height: 20),
          CustomTextFormField(
              isProfile: true,
              obscureText: obscureText,
              controller: passwordController,
              isEmail: false,
              hintText: 'Gender'),
          CustomFunction.customSpace(height: 20),
          CustomTextFormField(
              isProfile: true,
              obscureText: obscureText,
              controller: passwordController,
              isEmail: false,
              hintText: 'Job Level'),
          CustomFunction.customSpace(height: 20),
          CustomTextFormField(
              isProfile: true,
              obscureText: obscureText,
              controller: passwordController,
              isEmail: false,
              hintText: 'Phone Number'),
          CustomFunction.customSpace(height: 20),
          CustomButton(text: 'Save Changes', onTap: () {})
        ],
      ),
      // ),
    );
  }
}
