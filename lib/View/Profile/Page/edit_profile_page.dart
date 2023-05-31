// ignore_for_file: must_be_immutable

import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/UIDesign/custom_scaffold.dart';
import 'package:coursia/UIDesign/custom_button.dart';
import 'package:coursia/UIDesign/custom_date_picker.dart';
import 'package:coursia/UIDesign/custom_dropdown.dart';
import 'package:coursia/UIDesign/custom_text.dart';
import 'package:coursia/UIDesign/custom_textformfield.dart';
import 'package:coursia/UIDesign/function.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phNoController = TextEditingController();

  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  String? date;
  String? selectedGender;
  final List<String> genderList = ['Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return CusotmScaffold(text: 'Edit Profile', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetDateSuccess) {
          date = state.date;
        }
        if (state is GetDropDownValueSuccess) {
          selectedGender = state.value;
        }
        return Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFunction.customSpace(height: 40),
                  Center(
                    child: Stack(
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
                  ),
                  CustomFunction.customSpace(height: 10),
                  Center(
                    child: CustomText(
                      text: 'Arkar Min Myat',
                      textColor: AppTheme.black,
                      size: 17.sp,
                    ),
                  ),
                  CustomFunction.customSpace(height: 10),
                  Center(
                    child: CustomText(
                      text: 'Data Engineer',
                      textColor: AppTheme.grey,
                      size: 12.sp,
                    ),
                  ),
                  CustomFunction.customSpace(height: 10),
                  CustomTextFormField(
                      isProfile: true,
                      controller: emailController,
                      isEmail: true,
                      hintText: '    Email Address'),
                  CustomFunction.customSpace(height: 20),
                  CustomTextFormField(
                      isProfile: true,
                      controller: userNameController,
                      isEmail: false,
                      hintText: '    Username'),
                  CustomFunction.customSpace(height: 20),
                  CustomTextFormField(
                      isProfile: true,
                      obscureText: obscureText,
                      controller: passwordController,
                      isEmail: false,
                      hintText: '    Password'),
                  CustomFunction.customSpace(height: 20),
                  CustomText(
                    text: 'Birth Date (Optional)',
                    textColor: AppTheme.grey,
                    size: 12.sp,
                  ),
                  CustomFunction.customSpace(height: 20),
                  CustomDatePicker(date: date),
                  CustomDropDown(
                    items: genderList,
                    hintText: 'Gender',
                    isSignUp: false,
                  ),
                  CustomFunction.customSpace(height: 20),
                  CustomDropDown(
                    items: genderList,
                    hintText: 'Job Level',
                    isSignUp: false,
                  ),
                  CustomFunction.customSpace(height: 20),
                  CustomTextFormField(
                      isProfile: true,
                      controller: phNoController,
                      isEmail: false,
                      hintText: '    Phone Number'),
                  CustomFunction.customSpace(height: 40),
                  Center(
                    child: CustomButton(
                      text: 'Save Changes',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.of(context).pop();
                        }
                        // log(date.toString());
                        // log(selectedGender.toString());
                      },
                      width: 140.w,
                      height: 35.h,
                      borderRadius: 25.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
