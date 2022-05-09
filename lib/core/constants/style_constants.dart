import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle whiteHdStyle(FontWeight weight) =>
      TextStyle(fontSize: 18.sp, fontWeight: weight, color: AppColors.offWhite);

  static TextStyle whiteSubHdStyle = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.offWhite);
}
