import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_export.dart';
import '../../../theme/custom_button_style.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_radio_button.dart';
import 'bloc/filter_bloc.dart';

// ignore_for_file: must_be_immutable
class FilterPage extends StatelessWidget {
  FilterPage({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<FilterBloc>(
      create: (context) => FilterBloc(
        // Fix: Remove the FilterState() completely as FilterBloc likely doesn't expect any arguments
        // Or if it needs a FilterState, check how it's properly initialized
      )..add(FilterInitialEvent()),
      child: FilterPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      appBar: _buildAppBar(context),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 8.h,
                top: 6.h,
                right: 8.h,
              ),
              child: Column(
                children: [
                  SizedBox(height: 4.h),
                  Container(
                    width: double.maxFinite,
                    // Fix 3: Replace copyWith with a direct BorderRadius assignment
                    decoration: AppDecoration.outlinePrimary(context).copyWith(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(44.h),
                        topRight: Radius.circular(44.h),
                      ),
                    ),
                    child: Column(
                      // Fix: Remove spacing which isn't a valid Column property
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        Container(
                          height: 3.h,
                          width: 46.h,
                          decoration: BoxDecoration(
                            color: appTheme.orangeA200,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "msg_what_are_you_looking".tr,
                              style: CustomTextStyles.titleMediumBluegray900,
                            ),
                          ),
                        ),
                        _buildSearchFilters(context),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "lbl_sort_results_by".tr,
                              style: CustomTextStyles.titleMediumBluegray900,
                            ),
                          ),
                        ),
                        _buildSortOptions(context),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.h),
                            child: Text(
                              "msg_when_do_you_need".tr,
                              style: CustomTextStyles.titleMediumBluegray900,
                            ),
                          ),
                        ),
                        _buildTimePreferences(context),
                        CustomElevatedButton(
                          text: "lbl_filter".tr,
                          buttonStyle:
                          CustomButtonStyles.outlineSecondaryContainer,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.maxFinite,
        child: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 58.h,
      leadingWidth: 57.h,
      leading: AppBarLeadingImage(
        imagePath: ImageConstant.frame,
        height: 40.h,
        width: 38.h,
        margin: EdgeInsets.only(left: 19.h),
      ),
      actions: [
        AppTrailingImage(
          imagePath: ImageConstant.userProfile,
          height: 50.h,
          width: 50.h,
          margin: EdgeInsets.only(
            top: 4.h,
            right: 23.h,
            bottom: 3.h,
          ),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildSearchFilters(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        left: 14.h,
        right: 10.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        // Fix: Remove spacing property
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 14.h),
            child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomRadioButton(
                      text: "msg_student_discounts2".tr,
                      value: "msg_student_discounts2".tr,
                      groupValue: state.radioGroup,
                      onChange: (value) {
                        context
                            .read<FilterBloc>()
                            .add(ChangeRadioButtonEvent(value: value));
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: CustomRadioButton(
                        text: "msg_jobs_freelancing".tr,
                        value: "msg_jobs_freelancing".tr,
                        groupValue: state.radioGroup,
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 30.h,
                        ),
                        onChange: (value) {
                          context
                              .read<FilterBloc>()
                              .add(ChangeRadioButtonEvent(value: value));
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6.h),
                      child: CustomRadioButton(
                        text: "msg_creative_activities2".tr,
                        value: "msg_creative_activities2".tr,
                        groupValue: state.radioGroup,
                        padding: EdgeInsets.only(
                          left: 10.h,
                          right: 30.h,
                        ),
                        onChange: (value) {
                          context
                              .read<FilterBloc>()
                              .add(ChangeRadioButtonEvent(value: value));
                        },
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 14.h,
            ),
          ),
          BlocSelector<FilterBloc, FilterState, String?>(
            selector: (state) => state.radioGroup1,
            builder: (context, radioGroup1) {
              return CustomRadioButton(
                text: "msg_leisure_travel".tr,
                value: "msg_leisure_travel".tr,
                groupValue: radioGroup1,
                onChange: (value) {
                  context
                      .read<FilterBloc>()
                      .add(ChangeRadioButton1Event(value: value));
                },
              );
            },
          ),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 14.h,
            ),
          ),
          BlocSelector<FilterBloc, FilterState, String?>(
            selector: (state) => state.radioGroup2,
            builder: (context, radioGroup2) {
              return CustomRadioButton(
                text: "msg_handy_jobs_services".tr,
                value: "msg_handy_jobs_services".tr,
                groupValue: radioGroup2,
                onChange: (value) {
                  context
                      .read<FilterBloc>()
                      .add(ChangeRadioButton2Event(value: value));
                },
              );
            },
          ),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 14.h,
            ),
          ),
          BlocSelector<FilterBloc, FilterState, String?>(
            selector: (state) => state.radioGroup3,
            builder: (context, radioGroup3) {
              return CustomRadioButton(
                text: "lbl_news2".tr,
                value: "lbl_news2".tr,
                groupValue: radioGroup3,
                onChange: (value) {
                  context
                      .read<FilterBloc>()
                      .add(ChangeRadioButton3Event(value: value));
                },
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSortOptions(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 14.h,
        right: 10.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondaryContainer.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      ),
      width: double.maxFinite,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomRadioButton(
                text: "lbl_newest_first".tr,
                value: "lbl_newest_first".tr,
                groupValue: state.sortOptions,
                onChange: (value) {
                  context
                      .read<FilterBloc>()
                      .add(ChangeRadioButton4Event(value: value));
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: CustomRadioButton(
                  text: "lbl_highest_rated".tr,
                  value: "lbl_highest_rated".tr,
                  groupValue: state.sortOptions,
                  padding: EdgeInsets.only(
                    left: 4.h,
                    right: 28.h,
                  ),
                  onChange: (value) {
                    context
                        .read<FilterBloc>()
                        .add(ChangeRadioButton4Event(value: value));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: CustomRadioButton(
                  text: "lbl_closest_to_me".tr,
                  value: "lbl_closest_to_me".tr,
                  groupValue: state.sortOptions,
                  padding: EdgeInsets.only(
                    left: 10.h,
                    right: 30.h,
                  ),
                  onChange: (value) {
                    context
                        .read<FilterBloc>()
                        .add(ChangeRadioButton4Event(value: value));
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildTimePreferences(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 14.h,
        right: 10.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondaryContainer.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          )
        ],
      ),
      width: double.maxFinite,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.h),
                child: CustomRadioButton(
                  text: "lbl_today".tr,
                  value: "lbl_today".tr,
                  groupValue: state.timePreferences,
                  onChange: (value) {
                    context
                        .read<FilterBloc>()
                        .add(ChangeRadioButton5Event(value: value));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: CustomRadioButton(
                  text: "lbl_this_week".tr,
                  value: "lbl_this_week".tr,
                  groupValue: state.timePreferences,
                  padding: EdgeInsets.only(
                    left: 8.h,
                    right: 30.h,
                  ),
                  onChange: (value) {
                    context
                        .read<FilterBloc>()
                        .add(ChangeRadioButton5Event(value: value));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (dynamic type) {
        Navigator.pushNamed(context, getCurrentRoute(type));
      },
    );
  }

  /// Handling route based on bottom click actions
  String getCurrentRoute(ButtomBarEnum type) {
    switch (type) {
      case ButtomBarEnum.Favorite:
        return AppRoutes.likedScreen;
      case ButtomBarEnum.Searchwhitea700:
        return AppRoutes.filterPage;
      case ButtomBarEnum.Lock:
        return AppRoutes.personScreen;
      case ButtomBarEnum.Home:
      default:
        return AppRoutes.homePage;
    }
  }
}