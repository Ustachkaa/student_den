import 'package:flutter/material.dart';
import 'package:student_den/Presentation/Presentation_Main/activities_category_page/activities_category_screen.dart';
import '../../../core/app_export.dart';
import '../../../widgets/app_bar/appbar_leading_image.dart';
import '../../../widgets/app_bar/appbar_trailing_image.dart';
import '../../../widgets/app_bar/custom_app_bar.dart';
import '../../../widgets/custom_bottom_bar.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_search_view.dart';
import 'bloc/liked_bloc.dart';
import 'models/discountslist_item_model.dart';
import 'models/liked_model.dart';
import 'widgets/discountslist_item_widget.dart';

// ignore_for_file: must_be_immutable
class LikedScreen extends StatelessWidget {
  LikedScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<LikedBloc>(
      create: (context) => LikedBloc(LikedState(
        likedModelObj: LikedModel(),
      ))
        ..add(LikedInitialEvent()),
      child: LikedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.whiteA700,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6.h),
                  Container(
                    width: 410.h,
                    margin: EdgeInsets.only(left: 18.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSearchSection(context),
                        SizedBox(height: 44.h),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            "msg_discounts_for_you".tr,
                            style: CustomTextStyles.titleMediumGray600,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _buildDiscountsList(context),
                        SizedBox(height: 16.h),
                        Padding(
                          padding: EdgeInsets.only(left: 10.h),
                          child: Text(
                            "msg_handy_work_help".tr,
                            style: CustomTextStyles.titleMediumGray600,
                          ),
                        ),
                        SizedBox(height: 22.h),
                        Container(
                          width: 178.h,
                          margin: EdgeInsets.only(left: 10.h),
                          padding: EdgeInsets.all(10.h),
                          decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder14,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.furnitureService,
                                height: 96.h,
                                width: double.maxFinite,
                                radious: BorderRadius.circular(12.h),
                                margin: EdgeInsets.symmetric(horizontal: 4.h),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                "msg_furniture_assembly".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "lbl_25_hour".tr,
                                  style: CustomTextStyles.labelMediumBold,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              SizedBox(
                                width: double.maxFinite,
                                child: _buildBikeRentalsRow(
                                  context,
                                  signalText: "lbl_4_7".tr,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          height: 22.h,
                          width: 204.h,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                        SizedBox(height: 16.h),
                        _buildHorizontalScrollDiscounts(context)
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
  Widget _buildSearchSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(right: 18.h),
      child: Column(
        spacing: 12,
        children: [
          CustomAppBar(
            height: 58.h,
            leadingWidth: 38.h,
            leading: AppBarLeadingImage(
              imagePath: ImageConstant.frame,
              height: 40.h,
              width: 38.h,
            ),
            actions: [
              AppTrailingImage(
                imagePath: ImageConstant.userProfile,
                height: 50.h,
                width: 50.h,
                margin: EdgeInsets.only(
                  top: 4.h,
                  right: 4.h,
                  bottom: 3.h,
                ),
              ),
            ],
            styleType: Style.bgFillWhiteA700,
          ),
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(right: 4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: BlocSelector<LikedBloc, LikedState,
                      TextEditingController?>(
                    selector: (state) => state.searchtwoController,
                    builder: (context, searchtwoController) {
                      return CustomSearchView(
                        controller: searchtwoController,
                        hintText: "lbl_search".tr,
                        contentPadding:
                        EdgeInsets.fromLTRB(14.h, 6.h, 6.h, 6.h),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDiscountsList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10.h,
        right: 38.h,
      ),
      width: double.maxFinite,
      child: BlocSelector<LikedBloc, LikedState, LikedModel?>(
        selector: (state) => state.likedModelObj,
        builder: (context, likedModelObj) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 10.h,
              children: List.generate(
                likedModelObj?.discountslistItemList.length ?? 0,
                    (index) {
                  DiscountslistItemModel model =
                      likedModelObj?.discountslistItemList[index] ??
                          DiscountslistItemModel();
                  return DiscountslistItemWidget(
                    model,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHorizontalScrollDiscounts(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicWidth(
          child: SizedBox(
            width: 554.h,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(10.h),
                    decoration:
                    AppDecoration.outlineSecondaryContainer1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.bike,
                          height: 96.h,
                          width: double.maxFinite,
                          radious: BorderRadius.circular(12.h),
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "lbl_bike_rentals".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "lbl_30_off".tr,
                          style: CustomTextStyles.labelMediumBold_1,
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildBikeRentalsRow(
                            context,
                            signalText: "lbl_4_5".tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 16.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.popcorn,
                          height: 96.h,
                          width: double.maxFinite,
                          radious: BorderRadius.circular(12.h),
                          margin: EdgeInsets.symmetric(horizontal: 4.h),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "lbl_cinema_tickets".tr,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "lbl_50_off".tr,
                          style: CustomTextStyles.labelMediumBold_1,
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: _buildBikeRentalsRow(
                            context,
                            signalText: "lbl_4_5".tr,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 16.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder14,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.yoga,
                          height: 96.h,
                          width: double.maxFinite,
                          radious: BorderRadius.circular(12.h),
                          margin: EdgeInsets.only(left: 4.h),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "lbl_yoga_retreats".tr,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.titleMedium,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "msg_50_for_two_days".tr,
                          style: CustomTextStyles.labelMediumBold_1,
                        ),
                        SizedBox(height: 12.h),
                        SizedBox(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.signal,
                                height: 24.h,
                                width: 24.h,
                              ),
                              Text(
                                "lbl_4_9".tr,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (dynamic type) {
        Navigator.pushNamed(context, getCurrentRoute(type));
      },
    );
  }

  /// Common widget
  Widget _buildBikeRentalsRow(
      BuildContext context, {
        required String signalText,
      }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomImageView(
          imagePath: ImageConstant.signal,
          height: 24.h,
          width: 26.h,
          margin: EdgeInsets.only(top: 4.h),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            signalText,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.favoriteOnprimary,
          height: 24.h,
          width: 26.h,
        )
      ],
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