// ✅ Student registration screen with required fields and password confirmation
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_den/core/app_export.dart';
import 'package:student_den/theme/custom_button_style.dart';
import 'package:student_den/widgets/custom_drop_down.dart';
import 'package:student_den/widgets/custom_elevated_button.dart';
import 'package:student_den/widgets/custom_text_form_field.dart';
import '../../../data/models/selectionPopupModel/selection_popup_model.dart';
import 'bloc/student_registration_screen_bloc.dart';
import 'model/student_registration_screen_model.dart';

class StudentRegistrationScreen extends StatelessWidget {
  const StudentRegistrationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<StudentRegistrationBloc>(
      create: (context) => StudentRegistrationBloc(
        const StudentRegistrationState(
          studentRegistrationModelObj: StudentRegistrationModel(),
        ),
      )..add(StudentRegistrationInitialEvent()),
      child: const StudentRegistrationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(32.h, 32.h, 32.h, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomImageView(
                        key: const Key('logo'),
                        imagePath: 'assets/images/Logo.png',
                        height: 50.h,
                        width: 50.h,
                      ),
                      SizedBox(width: 12.h),
                      Expanded(
                        child: Text(
                          "msg_registration_for".tr,
                          style: CustomTextStyles.titleMediumSemibold17.copyWith(fontSize: 22.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  _buildTextFormFieldWithLabel(context, "lbl_full_name", isRequired: true),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_email_address", textInputType: TextInputType.emailAddress, isRequired: true),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_phone_number", textInputType: TextInputType.phone),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_password", obscureText: true, isRequired: true),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "msg_confirm_password", obscureText: true, isRequired: true),
                  SizedBox(height: 12.h),
                  _buildUniversityNameSection(context),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "msg_student_id_number", textInputType: TextInputType.number),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_year_of_study", textInputType: TextInputType.number),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_city_region"),
                  SizedBox(height: 12.h),
                  _buildTextFormFieldWithLabel(context, "lbl_address"),
                  SizedBox(height: 12.h),
                  _buildLanguageSelection(context),
                  SizedBox(height: 24.h),
                  _buildRegisterButton(context),
                  SizedBox(height: 16.h),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
                      },
                      child: Text(
                        "Back to login",
                        style: CustomTextStyles.labelMediumLarge.copyWith(
                          color: theme.colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormFieldWithLabel(BuildContext context, String label,
      {bool obscureText = false,
        TextInputType textInputType = TextInputType.text,
        bool isRequired = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRequired ? "${label.tr} *" : label.tr,
          style: CustomTextStyles.labelMediumLarge,
        ),
        SizedBox(height: 4.h),
        BlocSelector<StudentRegistrationBloc, StudentRegistrationState, TextEditingController?>(
          selector: (state) {
            switch (label) {
              case "lbl_full_name":
                return state.fullNameController;
              case "lbl_email_address":
                return state.emailController;
              case "lbl_phone_number":
                return state.phoneController;
              case "lbl_password":
                return state.passwordController;
              case "msg_confirm_password":
                return state.confirmPasswordController;
              case "msg_student_id_number":
                return state.studentIdController;
              case "lbl_year_of_study":
                return state.yearController;
              case "lbl_city_region":
                return state.cityController;
              case "lbl_address":
                return state.addressController;
              default:
                return null;
            }
          },
          builder: (context, controller) {
            return CustomTextFormField(
              controller: controller,
              obscureText: obscureText,
              textInputType: textInputType,
              contentPadding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            );
          },
        ),
      ],
    );
  }

  Widget _buildUniversityNameSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_university_college".tr, style: CustomTextStyles.labelMediumLarge),
        SizedBox(height: 4.h),
        BlocSelector<StudentRegistrationBloc, StudentRegistrationState, StudentRegistrationModel?>(
          selector: (state) => state.studentRegistrationModelObj,
          builder: (context, model) {
            return CustomDropDown(
              hintText: "msg_select_university".tr,
              items: model?.universityList ?? [],
              onChanged: (value) {},
            );
          },
        ),
      ],
    );
  }

  Widget _buildLanguageSelection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_language".tr, style: CustomTextStyles.labelMediumLarge),
        SizedBox(height: 4.h),
        CustomDropDown(
          hintText: "msg_select_language".tr,
          items: [
            SelectionPopupModel(id: 1, title: "English"),
            SelectionPopupModel(id: 2, title: "Georgian"),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return BlocBuilder<StudentRegistrationBloc, StudentRegistrationState>(
      builder: (context, state) {
        return CustomElevatedButton(
          height: 48.h,
          text: "lbl_register".tr,
          buttonStyle: CustomButtonStyles.fillPrimary,
          buttonTextStyle: CustomTextStyles.labelLargeWhiteA700,
          onPressed: () {
            final bloc = context.read<StudentRegistrationBloc>();
            final fullName = state.fullNameController?.text.trim() ?? '';
            final email = state.emailController?.text.trim() ?? '';
            final password = state.passwordController?.text.trim() ?? '';
            final confirmPassword = state.confirmPasswordController?.text.trim() ?? '';

            final emailValid = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
            final passwordValid = RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%?&.,])[A-Za-z\d@$!%?&.,]{8,}$',
            ).hasMatch(password);

            if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please fill in all required fields.")),
              );
              return;
            }

            if (!emailValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter a valid email address.")),
              );
              return;
            }

            if (!passwordValid) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Password must be at least 8 characters, include an uppercase letter, a number, and a special character."),
                ),
              );
              return;
            }

            if (password != confirmPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Passwords do not match.")),
              );
              return;
            }

            bloc.add(RegisterStudent(
              fullName: fullName,
              email: email,
              phoneNumber: state.phoneController?.text ?? '',
              password: password,
              university: state.universityController?.text ?? '',
              studentId: state.studentIdController?.text ?? '',
              yearOfStudy: state.yearController?.text ?? '',
              city: state.cityController?.text ?? '',
              address: state.addressController?.text ?? '',
              interests: [],
            ));

            Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
          },
        );
      },
    );
  }
}