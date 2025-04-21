import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// A widget that displays an image as the trailing widget in an AppBar.
class AppTrailingImage extends StatelessWidget {
  /// Creates an [AppTrailingImage] widget.
  AppTrailingImage({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.onTap,
    this.radius,
    this.margin,
  }) : super(key: key);

  /// The height of the image.
  final double? height;

  /// The width of the image.
  final double? width;

  /// The path to the image.
  final String imagePath;

  /// A callback function that is called when the image is tapped.
  final Function? onTap;

  /// The radius of the image.
  final double? radius;

  /// The margin around the image.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadiusStyle.roundedBorder10,
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath,
          height: height ?? 32.h,
          width: width ?? 32.h,
          fit: BoxFit.contain,
          radious: BorderRadius.circular(10.h),
        ),
      ),
    );
  }
}
