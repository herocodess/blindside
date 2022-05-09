import 'package:blindside/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ToastManager {
  static void successToast(BuildContext context, {required String message}) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.greenColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void errorToast(BuildContext context, {required String message}) {
    var snackBar = SnackBar(
      content: Text(message),
      backgroundColor: AppColors.redColor,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
