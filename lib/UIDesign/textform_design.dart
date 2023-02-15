import 'package:coursia/UIDesign/apptheme.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  bool? isEmail;
  final String? hinttext;
  IconButton? suffixicon;
  final String? requiredText;
  final bool? obscureText;
  final void Function(String)? onChange;
  final void Function()? onPress;

  CustomTextFormField(
      {super.key,
      required this.controller,
      required this.isEmail,
      required this.hinttext,
      this.suffixicon,
      this.requiredText,
      this.obscureText,
      this.onChange,
      this.onPress});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: widget.controller,
      obscureText: widget.obscureText ?? false,
      onChanged: (value) {
        final bool isValid = EmailValidator.validate(value);
        if (isValid) {
          setState(() {
            widget.suffixicon = IconButton(
                onPressed: () {}, icon: const Icon(Icons.check_circle));
          });
        } else if (!isValid) {
          if (widget.isEmail!) {
            setState(() {
              widget.suffixicon = IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_circle_outline));
            });
          }
        }
      },
      style: const TextStyle(color: AppTheme.white),
      decoration: InputDecoration(
          errorStyle: const TextStyle(color: AppTheme.grey),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.grey, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.orange, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: widget.hinttext,
          hintStyle: const TextStyle(color: AppTheme.grey),
          suffixIcon: widget.suffixicon),
      validator: (value) {
        if (value!.isEmpty) {
          return widget.requiredText ?? "This field is required.";
        }
        return null;
      },
    );
  }
}
