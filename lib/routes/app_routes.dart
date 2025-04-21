import 'package:flutter/material.dart';
import 'package:student_den/Presentation/Extra_Features/settings_page/settings_page.dart';
import 'package:student_den/Presentation/Extra_Features/filter_page/filter_page.dart';
import 'package:student_den/Presentation/Login_Registration/pre_login_page/pre_login_screen.dart';
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_category_screen.dart';
import 'package:student_den/Presentation/Presentation_Main/discount_category_page/discount_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/handy_work_category_page/handy_work_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/leisure_category_page/leisure_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/news_category_page/news_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/job_category_page/job_category_page.dart';
import 'package:student_den/Presentation/Presentation_Main/home_page_screen/home_page.dart';
import 'package:student_den/Presentation/Extra_Features/liked_screen/liked_screen.dart';
import 'package:student_den/Presentation/Extra_Features/person_screen/person_screen.dart';
import 'package:student_den/Presentation/Login_Registration/student_registration_screen/student_registration_screen.dart';
import 'package:student_den/Presentation/Login_Registration/login_page/login_screen.dart';
import 'package:student_den/Presentation/Login_Registration/forgot_password_screen/forgot_password_screen.dart';

import '../Presentation/Extra_Features/offers/bloc/offers_bloc.dart';
import '../Presentation/Presentation_Main/activities_category_page/bloc/activities_category_bloc.dart';
import '../Presentation/Presentation_Main/activities_category_page/models/activities_category_model.dart';
import '../core/app_export.dart';

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
  static const String discountCategoryPage = '/discount_category_page';      // Added
  static const String handyWorkCategoryPage = '/handy_work_category_page';    // Added
  static const String leisureCategoryPage = '/leisure_category_page';        // Added
  static const String newsCategoryPage = '/news_category_page';            // Added
  static const String jobCategoryPage = '/job_category_page';              // Added
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
    activitiesCategoryPage: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ActivitiesCategoryBloc(ActivitiesCategoryState(
            activitiesCategoryModelObj: ActivitiesCategoryModel(),
          ))..add(ActivitiesCategoryInitialEvent()),
        ),
        BlocProvider(
          create: (_) => OffersBloc()..add(LoadOffers()),
        ),
      ],
      child: const ActivitiesCategoryScreen(),
    ),

    discountCategoryPage: (context) => BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const DiscountCategoryPage(),
    ),

    handyWorkCategoryPage: (context) => BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const HandyWorkCategoryPage(),
    ),

    leisureCategoryPage: (context) => BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const LeisureCategoryPage(),
    ),

    newsCategoryPage: (context) => BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const NewsCategoryPage(),
    ),

    jobCategoryPage: (context) => BlocProvider(
      create: (_) => OffersBloc()..add(LoadOffers()),
      child: const JobCategoryPage(),
    ),                     // Added
    initialRoute: PreLoginScreen.builder,
  };
}