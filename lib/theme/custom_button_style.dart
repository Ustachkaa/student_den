import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A class that offers predefined button styles for customizing button appearance.
class CustomButtonStyles {
  /// Filled button style with BlueGray background color.
  static ButtonStyle get fillBlueGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.blueGray900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  /// Filled button style with Primary background color.
  static ButtonStyle get fillPrimary => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.h),
    ),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  /// Outlined button style with Primary background color.
  static ButtonStyle get outlineSecondaryContainer => ElevatedButton.styleFrom(
    backgroundColor: theme.colorScheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.h),
    ),
    shadowColor: theme.colorScheme.secondaryContainer.withOpacity(0.25),
    elevation: 0,
    padding: EdgeInsets.zero,
  );

  /// Text button style with no background color, elevation, padding, or side.
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
    side: MaterialStateProperty.all<BorderSide>(
      const BorderSide(color: Colors.transparent),
    ),
  );
}
