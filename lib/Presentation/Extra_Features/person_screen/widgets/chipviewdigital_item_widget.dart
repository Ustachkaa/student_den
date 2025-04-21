import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../models/chipviewdigital_item_model.dart';

// ignore_for_file: must_be_immutable
class ChipviewdigitalItemWidget extends StatelessWidget {
  ChipviewdigitalItemWidget(this.chipviewdigitalItemModelObj,
      {Key? key, this.onSelectedChipView})
      : super(
    key: key,
  );

  ChipviewdigitalItemModel chipviewdigitalItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 2.h,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipviewdigitalItemModelObj.digitalArts!,
        style: TextStyle(
          color: theme.colorScheme.secondaryContainer,
          fontSize: 20.0,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: (chipviewdigitalItemModelObj.isSelected ?? false),
      backgroundColor: appTheme.whiteA700,
      shadowColor: theme.colorScheme.secondaryContainer.withValues(
        alpha: 0.25,
      ),
      elevation: 2,
      selectedColor: appTheme.orangeA200,
      side: BorderSide.none,
      shape: (chipviewdigitalItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(
            10.h,
          ))
          : RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          10.h,
        ),
      ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
