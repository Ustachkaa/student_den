import 'package:flutter/material.dart';
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_category_screen.dart';
import 'package:student_den/widgets/custom_icon_button.dart';
import 'package:student_den/widgets/custom_search_view.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_title_image.dart';
import '../../../widgets/app_bar/appbar_trailing_image_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_bottom_bar.dart';
import 'bloc/settings_bloc.dart';
import 'model/settings_model.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(SettingsState(
        settingsModelObj: SettingsModel(),
      ))..add(SettingsInitialEvent()),
      child: SettingsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.whiteA700,
          appBar: _buildAppbar(context),
          body: SafeArea(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  _buildRowsearch(context),
                  _buildPerson(context),
                  _buildColumnlockone(context),
                  _buildColumnlanguager(context),
                  _buildColumnnotificat(context),
                  _buildColumnsecurity(context),
                  _buildColumnappprefer(context),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _buildBottombar(context),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppBarTitleImage(
        imagePath: ImageConstant.home,
      ),
      actions: [
        AppbarTrailingImageOne(
          imagePath: ImageConstant.rewind,
          height: 24.h,
          width: 24.h,
          margin: EdgeInsets.only(right: 30.h),
        )
      ],
    );
  }

  /// Section Widget
  Widget _buildRowsearch(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 6.h),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocSelector<SettingsBloc, SettingsState, TextEditingController?>(
              selector: (state) => state.searchthreeController,
              builder: (context, searchthreeController) {
                return CustomSearchView(
                  controller: searchthreeController,
                  hintText: "lbl_search".tr,
                  contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 6.h, 6.h),
                );
              },
            ),
          ),
          CustomIconButton(
            height: 48.h,
            width: 48.h,
            padding: EdgeInsets.all(8.h),
            decoration: IconButtonStyleHelper.none,
            child: CustomImageView(
              imagePath: ImageConstant.thumbsUp,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildPerson(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 10.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.userProfile,
            height: 50.h,
            width: 52.h,
            radious: BorderRadius.circular(10.h),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.h),
            child: Text(
              "lbl_elene_beridze".tr,
              style: CustomTextStyles.titleLargeBold,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.arrowRight,
            height: 24.h,
            width: 26.h,
            margin: EdgeInsets.only(right: 4.h),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlockone(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 10.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.lock,
                  height: 20.h,
                  width: 22.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.h),
                  child: Text(
                    "lbl_edit_profile".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.arrowRight,
                  height: 24.h,
                  width: 26.h,
                  alignment: Alignment.bottomCenter,
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 14.h),
            child: Column(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                    endIndent: 12.h,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowcheckmark(
                    context,
                    checkmarkImage: ImageConstant.user,
                    verificationStatusText: "lbl_change_password".tr,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 6.h),
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.lock,
              languageText: "msg_update_profile_picture".tr,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnlanguager(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Text(
            "msg_language_region".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.television,
              languageText: "lbl_select_language".tr,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.linkedIn,
              languageText: "msg_update_current_location".tr,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnnotificat(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_notifications".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.notification,
              languageText: "msg_push_notifications".tr,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.diversity,
              languageText: "msg_deal_discount".tr,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsecurity(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 6.h,
      ),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Text(
            "msg_security_verification".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.fingerPrint,
              languageText: "msg_enable_two_facto".tr,
            ),
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 10.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                    endIndent: 12.h,
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: _buildRowcheckmark(
                    context,
                    checkmarkImage: ImageConstant.checkMarkGreen,
                    verificationStatusText: "msg_view_verification".tr,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                imagePath: ImageConstant.twitter,
                height: 24.h,
                width: 24.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "msg_upload_verification".tr,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.arrowRight,
                height: 24.h,
                width: 24.h,
                margin: EdgeInsets.only(left: 16.h),
              )
            ],
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnappprefer(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_app_preferences".tr,
            style: theme.textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.mobile,
              languageText: "msg_dark_mode_light".tr,
            ),
          ),
          SizedBox(height: 10.h),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              endIndent: 22.h,
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: double.maxFinite,
            child: _buildRowtelevision(
              context,
              televisionImage: ImageConstant.user,
              languageText: "msg_manage_interests".tr,
            ),
          ),
          SizedBox(height: 8.h)
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottombar(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: CustomBottomBar(
        onChanged: (ButtomBarEnum type) { // Changed to match the expected type
          Navigator.pushNamed(
            context, // Use context instead of navigatorKey
            getCurrentRoute(type as BottomBarEnum),
          );
        },
      ),
    );
  }

  /// Common widget
  Widget _buildRowtelevision(
      BuildContext context, {
        required String televisionImage,
        required String languageText,
      }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: televisionImage,
          height: 24.h,
          width: 26.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            languageText,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.arrowRight,
          height: 24.h,
          width: 26.h,
        )
      ],
    );
  }

  /// Common widget
  Widget _buildRowcheckmark(
      BuildContext context, {
        required String checkmarkImage,
        required String verificationStatusText,
      }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: checkmarkImage,
          height: 24.h,
          width: 26.h,
          alignment: Alignment.bottomCenter,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.h),
          child: Text(
            verificationStatusText,
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.arrowRight,
          height: 12.h,
          width: 8.h,
        )
      ],
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Favorite:
        return AppRoutes.likedScreen;
      case BottomBarEnum.Home:
        return AppRoutes.homePage;
      case BottomBarEnum.SearchwhiteA700:
        return AppRoutes.filterPage;
      case BottomBarEnum.Lock:
        return AppRoutes.personScreen;
      default:
        return AppRoutes.homePage;
    }
  }
}