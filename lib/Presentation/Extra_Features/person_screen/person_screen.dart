import 'package:flutter/material.dart';
//import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_category_screen.dart';
import '../../../core/app_export.dart';
import '../../../theme/icon_button_style_helper.dart';
import '../../../widgets/app_bar/appbar_trailing_image_one.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_search_view.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'package:student_den/theme/app_decoration.dart';
import 'bloc/person_bloc.dart';
import 'models/chipviewdigital_item_model.dart';
import 'models/person_model.dart';
import 'widgets/chipviewdigital_item_widget.dart';

// ignore_for_file: must_be_immutable
class PersonScreen extends StatelessWidget {
  PersonScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<PersonBloc>(
      create: (context) => PersonBloc(PersonState(
        personModelObj: PersonModel(),
      ))
        ..add(PersonInitialEvent()),
      child: PersonScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.gray50,
      appBar: _buildAppbar(context),
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 6.h,
                top: 10.h,
                right: 6.h,
              ),
              child: Column(
                children: [
                  _buildRowsearch(context),
                  SizedBox(height: 36.h),
                  _buildRoweditone(context),
                  SizedBox(height: 2.h),
                  _buildColumnsearch(context),
                  SizedBox(height: 2.h),
                  _buildColumnsearch1(context),
                  SizedBox(height: 2.h),
                  _buildColumnsearch2(context),
                  SizedBox(height: 2.h),
                  _buildColumnsearch3(context),
                  SizedBox(height: 4.h),
                  _buildColumnuniversit(context),
                  _buildColumnsearch4(context),
                  _buildChipviewdigital(context),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppbar(BuildContext context) {
    return CustomAppBar(
      actions: [
        AppbarTrailingImageOne(
          imagePath: ImageConstant.home,
          margin: EdgeInsets.only(right: 31.h),
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
            child: BlocSelector<PersonBloc, PersonState, TextEditingController?>(
              selector: (state) => state.searcheightController,
              builder: (context, searcheightController) {
                return CustomSearchView(
                  controller: searcheightController,
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
            decoration: IconButtonStyleHelper.fillPrimaryContainer,
            child: CustomImageView(
              imagePath: ImageConstant.thumbsUp,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRoweditone(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.h),
      padding: EdgeInsets.only(
        left: 20.h,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: double.maxFinite,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.userProfile,
                height: 50.h,
                width: 52.h,
                radious: BorderRadius.circular(
                  10.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: Text(
                  "lbl_edit".tr,
                  style: CustomTextStyles.labelLargeGreen900,
                ),
              )
            ],
          ),
          Text(
            "lbl_elene_beridze".tr,
            style: CustomTextStyles.titleLargeBold,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsearch(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_full_name".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.fullNameController,
            builder: (context, fullNameController) {
              return CustomTextFormField(
                controller: fullNameController,
                hintText: "lbl_elene_beridze".tr,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsearch1(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.emailController,
            builder: (context, emailController) {
              return CustomTextFormField(
                controller: emailController,
                hintText: "msg_elene_beridze_student_tsu_ge".tr,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsearch2(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_phone".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.phoneController,
            builder: (context, phoneController) {
              return CustomTextFormField(
                controller: phoneController,
                hintText: "msg_995_555_123_456".tr,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsearch3(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_birthdate".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.dateController,
            builder: (context, dateController) {
              return CustomTextFormField(
                controller: dateController,
                hintText: "msg_march_12_2004_age".tr,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnuniversit(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_university".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.checkmarkoneController,
            builder: (context, checkmarkoneController) {
              return CustomTextFormField(
                controller: checkmarkoneController,
                hintText: "msg_tbilisi_state_university".tr,
                suffix: Container(
                  margin: EdgeInsets.fromLTRB(16.h, 6.h, 6.h, 6.h),
                  child: CustomImageView(
                    imagePath: ImageConstant.checkMarkGreen,
                    height: 34.h,
                    width: 24.h,
                    fit: BoxFit.contain,
                  ),
                ),
                suffixConstraints: BoxConstraints(
                  maxHeight: 48.h,
                ),
                contentPadding: EdgeInsets.fromLTRB(14.h, 6.h, 6.h, 6.h),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildColumnsearch4(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        spacing: 6,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_field_of_study".tr,
            style: CustomTextStyles.titleMediumBluegray900,
          ),
          BlocSelector<PersonBloc, PersonState, TextEditingController?>(
            selector: (state) => state.searchfiveController,
            builder: (context, searchfiveController) {
              return CustomTextFormField(
                controller: searchfiveController,
                hintText: "msg_international_relations".tr,
                textInputAction: TextInputAction.done,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 10.h,
                ),
                borderDecoration:
                TextFormFieldStyleHelper.outlineSecondaryContainer,
                filled: true,
                fillColor: appTheme.whiteA700,
              );
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildChipviewdigital(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      child: BlocSelector<PersonBloc, PersonState, PersonModel?>(
        selector: (state) => state.personModelObj,
        builder: (context, personModelObj) {
          return Wrap(
            runSpacing: 10.h,
            spacing: 10.h,
            children: List<Widget>.generate(
              personModelObj?.chipviewdigitalItemList.length ?? 0,
                  (index) {
                ChipviewdigitalItemModel model =
                    personModelObj?.chipviewdigitalItemList[index] ??
                        ChipviewdigitalItemModel();
                return ChipviewdigitalItemWidget(
                  model,
                );
              },
            ),
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

class TextFormFieldStyleHelper {
  static OutlineInputBorder outlineSecondaryContainer = OutlineInputBorder(
    borderSide: BorderSide(color: theme.colorScheme.secondaryContainer),
    borderRadius: BorderRadiusStyle.roundedBorder10,
  );
}
