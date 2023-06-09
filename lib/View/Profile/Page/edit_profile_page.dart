// ignore_for_file: must_be_immutable

import 'package:coursia/Model/gender_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/static_data.dart';
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

import '../../Auth/bloc/auth_bloc.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phNoController = TextEditingController();

  bool obscureText = true;
  final formKey = GlobalKey<FormState>();

  String? date;
  GenderModel? selectedGender;

  List<JobLevelModel> jobLevelList = [];
  List<GenderModel> genderList = [];
  JobLevelModel? jobLevel;

  getGenderList() {
    for (int i = 0; i < StaticData.mapGenderList.length; i++) {
      GenderModel genderModel = GenderModel(
          id: StaticData.mapGenderList[i]['id'],
          name: StaticData.mapGenderList[i]['name']);
      genderList.add(genderModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    getGenderList();
    context.read<AuthBloc>().add(const GetJobLevel());
    return CusotmScaffold(text: 'Edit Profile', data: bodyData(context));
  }

  bodyData(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is GetDropDownValueSuccess) {
          if (state.value.isGender == true) {
            selectedGender = state.value;
            // log("Gender${selectedGender?.id}");
          }
          if (state.value.isJobLevel == true) {
            jobLevel = state.value;
            // log("Job Level${jobLevel?.id}");
          }
        }
      },
      builder: (context, state) {
        if (state is GetDateSuccess) {
          date = state.date;
        }

        if (state is GetDropDownValueLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppTheme.orange,
            ),
          );
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
                    isCourses: false,
                    isSignUp: false,
                  ),
                  CustomFunction.customSpace(height: 30),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is GetJobLevelLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppTheme.orange,
                          ),
                        );
                      }
                      if (state is GetJobLevelSuccess) {
                        jobLevelList = state.jobLevelList!;
                      }
                      if (state is GetJobLevelFailed) {
                        return Center(
                          child: Column(
                            children: [
                              CustomFunction.customSpace(height: 200.h),
                              CustomText(
                                text: state.message,
                                textColor: AppTheme.white,
                              ),
                              CustomFunction.customSpace(height: 10.h),
                              CustomButton(
                                width: 100.w,
                                text: 'Reload',
                                onTap: () {
                                  context
                                      .read<AuthBloc>()
                                      .add(const GetJobLevel());
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      return CustomDropDown(
                        items: jobLevelList,
                        hintText: 'Job Level',
                        isCourses: false,
                        isSignUp: false,
                      );
                    },
                  ),
                  CustomFunction.customSpace(height: 25),
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
