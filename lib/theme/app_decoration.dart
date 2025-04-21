import 'package:flutter/material.dart';
import '../core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray50,
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );

  // Outline decorations
  static BoxDecoration outlinePrimary(BuildContext context) => BoxDecoration(
    color: Theme.of(context).canvasColor,
    border: Border.all(
      color: Theme.of(context).colorScheme.primary,
      width: 1.h,
    ),
  );

  static BoxDecoration get outlineSecondaryContainer => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer
            .withAlpha((0.25 * 255).toInt()),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(0, 2),
      )
    ],
  );

  static BoxDecoration get outlineSecondaryContainer1 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer
            .withAlpha((0.25 * 255).toInt()),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(0, 4),
      )
    ],
  );

  static BoxDecoration get outlineSecondaryContainer2 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer
            .withAlpha((0.25 * 255).toInt()),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(0, 4.07),
      )
    ],
  );

  static BoxDecoration get outlineSecondaryContainer3 => BoxDecoration(
    color: appTheme.whiteA700,
    boxShadow: [
      BoxShadow(
        color: theme.colorScheme.secondaryContainer
            .withAlpha((0.25 * 255).toInt()),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: const Offset(0, 3.58),
      )
    ],
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius circleBorder2 = BorderRadius.circular(
    2.h,
  );

  // Custom borders
  static BorderRadius get customBorderTl14 => BorderRadius.vertical(
    top: Radius.circular(
      14.h,
    ),
  );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
    10.h,
  );
  static BorderRadius get roundedBorder14 => BorderRadius.circular(
    14.h,
  );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20.h,
  );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
    40.h,
  );
  static BorderRadius get roundedBorder6 => BorderRadius.circular(
    6.h,
  );
}
