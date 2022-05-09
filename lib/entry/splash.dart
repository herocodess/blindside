import 'dart:async';

import 'package:blindside/core/constants/assets.dart';
import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/managers/shared_preference_manager.dart';
import 'package:blindside/route/custom_navigator.dart';
import 'package:blindside/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool firstTime = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // CustomNavigator.pushReplace(context, registerPage);

      firstTime = SharedPreferencesManager.getBool('isFirstTime');
      if (!firstTime) {
        CustomNavigator.pushReplace(context, loginPage);
      } else {
        CustomNavigator.pushReplace(context, registerPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBgColor,
      body: Center(child: SvgPicture.asset(logo)),
    );
  }
}
