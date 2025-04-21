import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/theme/custom_button_style.dart';
import 'package:student_den/widgets/custom_elevated_button.dart';
import 'package:student_den/widgets/custom_text_form_field.dart';
import 'bloc/login_screen_bloc.dart';
import 'model/login_screen_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginScreenBloc>(
      create: (context) => LoginScreenBloc(
        LoginScreenState(
          loginScreenModelObj: LoginScreenModel(),
        ),
      )..add(LoginScreenInitialEvent()),
      child: const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginScreenBloc, LoginScreenState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          Navigator.pushReplacementNamed(context, AppRoutes.homePage);
        } else if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'Login failed.')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.whiteA700,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(42.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h), // push logo up
                  Center(
                    child: CustomImageView(
                      key: const Key('logo'),
                      imagePath: 'assets/images/Logo.png',
                      height: 90.h,
                      width: 90.h,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  _buildLoginSection(context, state),
                  SizedBox(height: 24.h),
                  _buildFooterSection(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmailSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email".tr,
            style: CustomTextStyles.labelMediumLarge,
          ),
          SizedBox(height: 6.h),
          BlocSelector<LoginScreenBloc, LoginScreenState, TextEditingController?>(
            selector: (state) => state.emailController,
            builder: (context, emailController) {
              return CustomTextFormField(
                controller: emailController,
                hintText: "lbl_email".tr,
                hintStyle: theme.textTheme.titleLarge,
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordSection(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "lbl_password2".tr,
                style: CustomTextStyles.labelMediumLarge,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                },
                child: Text(
                  "msg_forgot_password".tr,
                  style: CustomTextStyles.labelMediumLightblue900,
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),
          BlocSelector<LoginScreenBloc, LoginScreenState, TextEditingController?>(
            selector: (state) => state.passwordController,
            builder: (context, passwordController) {
              return CustomTextFormField(
                controller: passwordController,
                hintText: "lbl_password2".tr,
                hintStyle: theme.textTheme.titleLarge,
                textInputAction: TextInputAction.done,
                obscureText: true,
                contentPadding: EdgeInsets.all(12.h),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoginSection(BuildContext context, LoginScreenState state) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Text(
            "msg_login_to_your_account".tr,
            style: CustomTextStyles.titleMediumSemibold20,
          ),
          SizedBox(height: 14.h),
          _buildEmailSection(context),
          SizedBox(height: 14.h),
          _buildPasswordSection(context),
          SizedBox(height: 14.h),
          CustomElevatedButton(
            height: 48.h,
            text: "lbl_login".tr,
            buttonStyle: CustomButtonStyles.fillPrimary,
            buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
            onPressed: () {
              if (state.emailController != null && state.passwordController != null) {
                BlocProvider.of<LoginScreenBloc>(context).add(
                  LoginUser(
                    email: state.emailController!.text,
                    password: state.passwordController!.text,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please enter email and password')),
                );
              }
            },
          ),
          if (state.status == LoginStatus.loading)
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildFooterSection(BuildContext context) {
    return Column(
      children: [
        Text(
          "msg_not_a_member_are".tr,
          style: theme.textTheme.labelMedium,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                "Service Provider",
                style: CustomTextStyles.labelMediumOnSecondaryContainer,
              ),
            ),
            Text(
              " or ",
              style: CustomTextStyles.labelMediumGray600,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.studentRegistrationScreen);
              },
              child: Text(
                "Student?",
                style: CustomTextStyles.labelMediumOnSecondaryContainer_1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}