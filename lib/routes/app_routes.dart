import 'package:flutter/material.dart';
import 'package:student_den/Presentation/Extra_Features/settings_page/settings_page.dart';
import 'package:student_den/Presentation/Extra_Features/filter_page/filter_page.dart';
import 'package:student_den/Presentation/Login_Registration/pre_login_page/pre_login_screen.dart';
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_category_screen.dart';
import 'package:student_den/Presentation/Presentation_Main/home_page_screen/home_page.dart';
import 'package:student_den/Presentation/Extra_Features/liked_screen/liked_screen.dart';
import 'package:student_den/Presentation/Extra_Features/person_screen/person_screen.dart';
import 'package:student_den/Presentation/Login_Registration/student_registration_screen/student_registration_screen.dart';
import 'package:student_den/Presentation/Login_Registration/login_page/login_screen.dart';
import 'package:student_den/Presentation/Login_Registration/forgot_password_screen/forgot_password_screen.dart';

class AppRoutes {
  static const String forgotPasswordPage = '/forgot_password_screen';
  static const String studentRegistrationScreen = '/student_registration_screen';
  static const String loginPage = '/login_page_screen';
  static const String preLoginPage = '/pre_login_screen';
  static const String homePage = '/home_page';
  static const String likedScreen = '/liked_screen';
  static const String filterPage = '/filter_page';
  static const String personScreen = '/person_screen';
  static const String settingsPage = '/settings_page';
  static const String activitiesCategoryPage = '/activities_category_screen';
  static const String initialRoute = '/pre_login_screen';

  static Map<String, WidgetBuilder> get routes => {
    forgotPasswordPage: ForgotPasswordScreen.builder,
    studentRegistrationScreen: StudentRegistrationScreen.builder,
    loginPage: LoginScreen.builder,
    preLoginPage: PreLoginScreen.builder,
    homePage: HomePage.builder,
    likedScreen: LikedScreen.builder,
    filterPage: FilterPage.builder,
    personScreen: PersonScreen.builder,
    settingsPage: SettingsPage.builder,
    activitiesCategoryPage: ActivitiesCategoryScreen.builder,
    initialRoute: PreLoginScreen.builder,
  };
}