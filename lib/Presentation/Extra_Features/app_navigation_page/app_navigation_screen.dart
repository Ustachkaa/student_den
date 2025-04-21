import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_export.dart';
import '../../../routes/app_routes.dart';
import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';

class ColorConstant {
  static Color whiteA700 = Colors.white;
}

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
      create: (context) => AppNavigationBloc(AppNavigationState(
        appNavigationModelObj: AppNavigationModel(),
      ))..add(AppNavigationInitialEvent()),
      child: AppNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          appBar: AppBar(
            title: Text(
              "App Navigation",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: ColorConstant.whiteA700,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      "Check your app's UI from the below demo screens of your app.",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildScreenTitle(
                            context,
                            screenTitle: "Pre Login Screen",
                            routeName: AppRoutes.preLoginPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Login Screen",
                            routeName: AppRoutes.loginPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Forgot Password Screen",
                            routeName: AppRoutes.forgotPasswordPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Student Registration Screen",
                            routeName: AppRoutes.studentRegistrationScreen,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Home Page",
                            routeName: AppRoutes.homePage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Liked Screen",
                            routeName: AppRoutes.likedScreen,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Filter Page",
                            routeName: AppRoutes.filterPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Person Screen",
                            routeName: AppRoutes.personScreen,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Settings Page",
                            routeName: AppRoutes.settingsPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Activities Category Page",
                            routeName: AppRoutes.activitiesCategoryPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Discount Category Page",
                            routeName: AppRoutes.discountCategoryPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Handy Work Category Page",
                            routeName: AppRoutes.handyWorkCategoryPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Leisure Category Page",
                            routeName: AppRoutes.leisureCategoryPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "News Category Page",
                            routeName: AppRoutes.newsCategoryPage,
                          ),
                          _buildScreenTitle(
                            context,
                            screenTitle: "Job Category Page",
                            routeName: AppRoutes.jobCategoryPage,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
      BuildContext context, {
        required String screenTitle,
        required String routeName,
      }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.whiteA700,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1.0,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          screenTitle,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}