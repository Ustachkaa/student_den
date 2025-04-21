import 'package:flutter/material.dart';

//these are the viewport values of your figma design
const num FIGMA_DESIGN_WIDTH = 430;
const num FIGMA_DESIGN_HEIGHT = 932;
const num FIGMA_DESIGN_STATUS_BAR = 0;

extension ResponsiveExtention on num {
  double get h => (this * SizeUtils.screenWidth) / FIGMA_DESIGN_WIDTH;

  double get dSize => (this * SizeUtils.screenWidth) / FIGMA_DESIGN_WIDTH;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  double isNonZero({num defaultValue = 0.0}) {
    return this > 0 ? this : defaultValue.toDouble();
  }
}

enum DeviceType {
  mobile,
  tablet,
  desktop,
}

typedef ResponsiveBuild = Widget Function(
    BuildContext context, Orientation orientation, DeviceType deviceType);

class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  //Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    SizeUtils.setScreenSize(context);
    return builder(
      context,
      MediaQuery.of(context).orientation,
      SizeUtils.deviceType,
    );
  }
}

// Ignore_for_file: must_be_immutable
class SizeUtils {
  ///Device's height
  static late double screenHeight;

  ///Device's width
  static late double screenWidth;

  ///type of device
  ///
  /// this can either be mobile or tablet
  static late DeviceType deviceType;

  static void setScreenSize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    deviceType = getDeviceType(context);
  }

  static DeviceType getDeviceType(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide < 600) {
      return DeviceType.mobile;
    } else if (shortestSide < 900) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }
}
