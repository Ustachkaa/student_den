import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  late String _appTheme;

  ThemeHelper() {
    // Initialize _appTheme in the constructor
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    // Use the singleton instance directly instead of getInstance()
    _appTheme = PrefUtils().getThemeData();
  }

  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();

  /// Returns the lightcode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  // Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.gray100,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          shadowColor: colorScheme.secondaryContainer.withOpacity(0.25),
          elevation: 2,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return appTheme.lightBlue900;
          }
          return Colors.transparent;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.gray600,
      ),
    );
  }

  /// Returns the default theme type.
  String get defaultTheme => 'lightCode';
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
    bodyMedium: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 10,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      color: appTheme.blueGray900,
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 11,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 9,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 20,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: colorScheme.secondaryContainer,
      fontSize: 15,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
  );
}


/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFF1C7690),
    secondaryContainer: Color(0XFF000000),
    onPrimary: Color(0XFF1C181F),
    onPrimaryContainer: Color(0XFFFB991C),
    onSecondaryContainer: Color(0XFF05256A),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray900 => Color(0XFF022539);

  // Gray
  Color get gray100 => Color(0XFFF5F5F5);
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray600 => Color(0XFF828282);

  // Green
  Color get green700 => Color(0XFF1CA815);
  Color get green900 => Color(0XFF008427);

  // LightBlue
  Color get lightBlue900 => Color(0XFF0064A1);

  // Orange
  Color get orangeA200 => Color(0XFFE29344);

  // Red
  Color get redA700 => Color(0XFFFF0004);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);

}
