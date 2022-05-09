import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/core/managers/toast_manager.dart';
import 'package:blindside/dependency_injection.dart';
import 'package:blindside/features/login/domain/entity/login_entity.dart';
import 'package:blindside/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:blindside/features/login/presentation/widgets/app_text_field.dart';
import 'package:blindside/main.dart';
import 'package:blindside/route/custom_navigator.dart';
import 'package:blindside/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGreyColor.withOpacity(0.3),
      body: BlocProvider<LoginBloc>(
        create: (context) => dI<LoginBloc>(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              appUser = state.user;
              CustomNavigator.pushReplace(context, dashboardPage);
              ToastManager.successToast(context,
                  message: 'Welcome back ${appUser!.email}');
            }

            if (state is LoginFailure) {
              ToastManager.errorToast(context, message: state.exception);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YBox(150.dy),
                  Text(
                    'Welcome back!',
                    style: AppStyles.whiteHdStyle(FontWeight.w600),
                  ),
                  YBox(10.dy),
                  Text(
                    'You stopped training for a minute 👀',
                    style: AppStyles.whiteSubHdStyle,
                  ),
                  YBox(20.dy),
                  AppTextFieldWidget(
                    controller: emailController,
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  YBox(40.dy),
                  AppTextFieldWidget(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                  YBox(20.dy),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password?',
                      style: AppStyles.whiteSubHdStyle,
                    ),
                  ),
                  YBox(60.dy),
                  InkWell(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ToastManager.errorToast(context,
                            message: 'One of more fields cannot be empty');
                      } else {
                        BlocProvider.of<LoginBloc>(context).add(LoginUserEvent(
                            entity: LoginEntity(
                                email: emailController.text,
                                password: passwordController.text)));
                      }
                    },
                    child: Container(
                      width: double.maxFinite,
                      height: 45.dy,
                      decoration: const BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Log In'.toUpperCase(),
                          style: AppStyles.whiteHdStyle(FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  YBox(40.dy),
                  InkWell(
                    onTap: () =>
                        CustomNavigator.pushReplace(context, registerPage),
                    child: Center(
                      child: Text(
                        "Don't have an account? Sign up",
                        style: AppStyles.whiteSubHdStyle,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
