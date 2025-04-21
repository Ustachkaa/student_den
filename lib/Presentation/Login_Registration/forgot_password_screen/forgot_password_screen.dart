// ✅ Updated forgot_password_screen.dart with layout adjustments and enlarged UI
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/theme/custom_button_style.dart';
import 'package:student_den/widgets/custom_elevated_button.dart';
import 'package:student_den/widgets/custom_text_form_field.dart';
import 'package:student_den/Presentation/Login_Registration/forgot_password_screen/bloc/forgot_password_screen_bloc.dart';
import 'package:student_den/Presentation/Login_Registration/forgot_password_screen/model/forgot_password_screen_model.dart';
import 'package:student_den/routes/app_routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      create: (context) => ForgotPasswordBloc(
        ForgotPasswordState(
          emailController: TextEditingController(),
          isResetEmailSent: false,
          forgotPasswordModelObj: ForgotPasswordModel(),
        ),
      )..add(ForgotPasswordInitialEvent()),
      child: const ForgotPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 42.h, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CustomImageView(
                  key: const Key('logo'),
                  imagePath: 'assets/images/Logo.png',
                  height: 90.h,
                  width: 90.h,
                ),
              ),
              SizedBox(height: 24.h),
              _buildForgotPasswordSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "lbl_email".tr,
          style: CustomTextStyles.labelMediumLarge,
        ),
        SizedBox(height: 6.h),
        BlocSelector<ForgotPasswordBloc, ForgotPasswordState, TextEditingController?>(
          selector: (state) => state.emailController,
          builder: (context, emailController) {
            return CustomTextFormField(
              controller: emailController,
              hintText: "msg_enter_your_email".tr,
              hintStyle: theme.textTheme.titleLarge,
              textInputType: TextInputType.emailAddress,
              contentPadding: EdgeInsets.all(12.h),
            );
          },
        ),
      ],
    );
  }

  Widget _buildForgotPasswordSection(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("msg_reset_instructions_sent".tr),
              duration: const Duration(seconds: 3),
            ),
          );
        }
        if (state.status == ForgotPasswordStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage ?? 'Failed to send reset email.'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "msg_forgot_password".tr,
              style: CustomTextStyles.titleMediumSemibold20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              "msg_enter_email_to_reset".tr,
              style: CustomTextStyles.labelMediumLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            _buildEmailSection(context),
            SizedBox(height: 24.h),
            if (state.status == ForgotPasswordStatus.loading)
              const CircularProgressIndicator()
            else
              CustomElevatedButton(
                height: 48.h,
                text: "lbl_reset_password".tr,
                buttonStyle: CustomButtonStyles.fillPrimary,
                buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
                onPressed: () {
                  context.read<ForgotPasswordBloc>().add(
                    ResetPasswordEvent(state.emailController?.text ?? ''),
                  );
                },
              ),
            SizedBox(height: 16.h),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.loginPage),
              child: Text(
                "lbl_back_to_login".tr,
                style: CustomTextStyles.labelMediumBold,
              ),
            ),
          ],
        );
      },
    );
  }
}