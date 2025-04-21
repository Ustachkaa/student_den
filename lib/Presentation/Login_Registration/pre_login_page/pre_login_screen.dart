import 'package:flutter/material.dart';
import 'package:student_den/core/app_export.dart';
import 'bloc/pre_login_screen_bloc.dart';
import 'models/pre_login_screen_model.dart';
import 'package:student_den/routes/app_routes.dart';

/// Screen to show the logo and transition after to login
class PreLoginScreen extends StatelessWidget {
  /// Properties that needs the screen
  const PreLoginScreen({Key? key}) : super(key: key);

  /// Function to call BLoC here
  static Widget builder(BuildContext context) {
    return BlocProvider<PreLoginScreenBloc>(
      create: (context) => PreLoginScreenBloc(
        const PreLoginScreenInitial( // Use the concrete subclass
          preLoginScreenModelObj: PreLoginScreenModel(),
        ),
      )..add(PreLoginScreenInitialEvent()),
      child: const PreLoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreLoginScreenBloc, PreLoginScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.whiteA700,
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
              },
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 266.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      key: const Key('logo'),
                      imagePath: 'assets/images/Logo.png',
                      height: 90.h,
                      width: 90.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}