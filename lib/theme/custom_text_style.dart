import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
class CustomTextStyles {
  // Body text style
  static TextStyle bodyMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Theme.of(context).colorScheme.secondaryContainer,
      );

  // Label text style
  static TextStyle get labelLargeGray600 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeGreen900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.green900,
      );

  static TextStyle get labellargeLightBlue900 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.lightBlue900,
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeSemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeSemiBold13 =>
      theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
      );

  static TextStyle get labelLargeSemiBold13_1 =>
      theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 13.0,
      );

  static TextStyle get labelLargeWhiteA700 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelLargeWhiteA700SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700,
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get labelMediumBold_1 => theme.textTheme.labelMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle get labelMediumGray600 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.gray600,
  );

  static TextStyle get labelMediumLightblue900 => theme.textTheme.labelMedium!.copyWith(
    color: appTheme.lightBlue900,
  );

  static TextStyle get labelMediumMedium => theme.textTheme.labelMedium!.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelMediumMedium10 => theme.textTheme.labelMedium!.copyWith(
    fontSize: 10.0,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelMediumOnSecondaryContainer => theme.textTheme.labelMedium!.copyWith(
    color: theme.colorScheme.onSecondaryContainer,
  );

  static TextStyle get labelMediumOnSecondaryContainer_1 => theme.textTheme.labelMedium!.copyWith(
    color: theme.colorScheme.onSecondaryContainer,
  );

  static TextStyle get labelSmallBluegray900 => theme.textTheme.labelSmall!.copyWith(
    color: appTheme.blueGray900,
    fontSize: 8.0,
  );

  // Title text style
  static TextStyle get titleLargeBold => theme.textTheme.titleLarge!.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle get titleLargeOrangeA200 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.orangeA200,
  );

  static TextStyle get titleLargeWhiteA700 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.whiteA700,
  );

  static TextStyle get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 18.0,
  );

  static TextStyle get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.blueGray900.withAlpha((0.7 * 255).toInt()),
    fontWeight: FontWeight.w500,
  );

  static TextStyle get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.gray600,
    fontSize: 18.0,
  );

  static TextStyle get titleMediumLightblue900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.lightBlue900,
    fontSize: 18.0,
  );

  static TextStyle get titleMediumOnPrimaryContainer => theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
    fontSize: 18.0,
  );

  static TextStyle get titleMediumSemibold => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleMediumSemibold17 => theme.textTheme.titleMedium!.copyWith(
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleMediumSemibold20 => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );

  static TextStyle get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 18.0,
  );

  static TextStyle get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
  );

  static TextStyle get labelMediumLarge => theme.textTheme.labelMedium!.copyWith(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleSmall14 => theme.textTheme.titleSmall!.copyWith(
    fontSize: 14.0,
  );

  static TextStyle get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
}
