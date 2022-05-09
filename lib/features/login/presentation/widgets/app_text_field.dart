import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: AppStyles.whiteSubHdStyle,
      keyboardType: inputType,
      decoration: InputDecoration(
        errorMaxLines: 2,
        isCollapsed: true,
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 16, 15),
        hintText: hintText,
        hintStyle: AppStyles.whiteSubHdStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: AppColors.appGreyColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: AppColors.offWhite,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: const Color(0xFF4F4F4F).withOpacity(0.4),
            width: 0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: const Color(0xFF4F4F4F).withOpacity(0.4),
            width: 1.12,
          ),
        ),
      ),
    );
  }
}
