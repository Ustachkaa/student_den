import 'package:flutter/material.dart';
import 'package:student_den/core/app_export.dart';
import '../model/interest_chip_model.dart';

/// Custom chip widget for interest selection in student registration
class InterestChipWidget extends StatelessWidget {
  /// Call the properties here
  const InterestChipWidget(
      this.interestChipModel, {
        Key? key,
        this.onSelected,
      }) : super(key: key);

  ///Model for data
  final InterestChipModel interestChipModel;

  /// To call the ontap here
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.all(4.h),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        interestChipModel.interestName!,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondaryContainer,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
      selected: interestChipModel.isSelected,
      backgroundColor: appTheme.whiteA700,
      shadowColor: theme.colorScheme.secondaryContainer.withOpacity(0.25),
      elevation: 2,
      selectedColor: appTheme.orangeA200,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(10.h),
      ),
      onSelected: (value) {
        onSelected?.call(value);
      },
    );
  }
}
