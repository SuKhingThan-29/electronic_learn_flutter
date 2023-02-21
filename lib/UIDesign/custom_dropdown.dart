import 'package:coursia/UIDesign/app_theme.dart';
import 'package:coursia/View/Profile/bloc/profile_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  final String? hintText;
  final List<String> items;
  const CustomDropDown(
      {super.key, required this.hintText, required this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: const InputDecoration(
        errorStyle: TextStyle(color: AppTheme.black),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.orange)),
        fillColor: Colors.white,
        isDense: true,
        // contentPadding: EdgeInsets.zero,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.orange)),
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.greyDark)),
      ),
      //isExpanded: true,
      hint: Text(
        hintText!,
        style: const TextStyle(color: AppTheme.grey),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: AppTheme.greyDark,
      ),
      iconSize: 30,
      buttonHeight: 30.h,
      //buttonPadding: const EdgeInsets.only(left: 5, right: 5).w,
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).r,
      ),

      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(color: AppTheme.black),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select $hintText.';
        }
        return null;
      },
      onChanged: (value) {
        context.read<ProfileBloc>().add(GetDropDownValue(value: value!));
      },
      onSaved: (value) {},
    );
  }
}
