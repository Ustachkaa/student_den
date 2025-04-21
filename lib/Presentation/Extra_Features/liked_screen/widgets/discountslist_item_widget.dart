import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/discountslist_item_model.dart';

// ignore_for_file: must_be_immutable
class DiscountslistItemWidget extends StatelessWidget {
  DiscountslistItemWidget(this.discountslistItemModelObj, {Key? key})
      : super(
    key: key,
  );

  DiscountslistItemModel discountslistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 176.h,
      padding: EdgeInsets.all(10.h),
      decoration: AppDecoration.outlineSecondaryContainer1.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder14,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.library,
            height: 96.h,
            width: double.maxFinite,
            radious: BorderRadius.circular(
              12.h,
            ),
            margin: EdgeInsets.symmetric(horizontal: 4.h),
          ),
          SizedBox(height: 12.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              discountslistItemModelObj.cafbeanland!,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 50.h,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 140.h,
                    child: Text(
                      discountslistItemModelObj.off!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumBold_1,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                            discountslistItemModelObj.fortyFive!,
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                CustomImageView(
                  imagePath: ImageConstant.favoriteOnprimary,
                  height: 24.h,
                  width: 26.h,
                  alignment: Alignment.bottomRight,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
