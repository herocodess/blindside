import 'package:blindside/core/constants/color_constants.dart';
import 'package:blindside/core/constants/dimensions.dart';
import 'package:blindside/core/constants/style_constants.dart';
import 'package:blindside/core/managers/toast_manager.dart';
import 'package:blindside/dependency_injection.dart';
import 'package:blindside/features/login/presentation/widgets/app_text_field.dart';
import 'package:blindside/features/register/domain/entity/register_entity.dart';
import 'package:blindside/features/register/presentation/bloc/bloc/register_bloc.dart';
import 'package:blindside/route/custom_navigator.dart';
import 'package:blindside/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGreyColor.withOpacity(0.3),
      body: BlocProvider<RegisterBloc>(
        create: (context) => dI<RegisterBloc>(),
        child: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              CustomNavigator.pushReplace(context, loginPage);
              ToastManager.successToast(context,
                  message: 'User Registered Successfully!');
            }

            if (state is RegisterFailure) {
              ToastManager.errorToast(context, message: state.exception);
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  YBox(150.dy),
                  Text(
                    'Create an account',
                    style: AppStyles.whiteHdStyle(FontWeight.w600),
                  ),
                  YBox(10.dy),
                  Text(
                    "Let's get you started at Blindside 👀",
                    style: AppStyles.whiteSubHdStyle,
                  ),
                  YBox(20.dy),
                  AppTextFieldWidget(
                    controller: fullnameController,
                    hintText: 'Fullname',
                  ),
                  YBox(40.dy),
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
                  YBox(60.dy),
                  InkWell(
                    onTap: () {
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty ||
                          fullnameController.text.isEmpty) {
                        ToastManager.errorToast(context,
                            message: 'One of more fields cannot be empty');
                      } else {
                        BlocProvider.of<RegisterBloc>(context).add(
                            RegisterUserEvent(
                                entity: RegisterEntity(
                                    email: emailController.text,
                                    fullname: fullnameController.text,
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
                          'Register'.toUpperCase(),
                          style: AppStyles.whiteHdStyle(FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  YBox(40.dy),
                  InkWell(
                    onTap: () =>
                        CustomNavigator.pushReplace(context, loginPage),
                    child: Center(
                      child: Text(
                        'Already have an account? Sign up',
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
