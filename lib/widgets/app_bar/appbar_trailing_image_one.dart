import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// A widget that displays an image as the trailing widget in an AppBar.
class AppbarTrailingImageOne extends StatelessWidget {
  /// Creates an [AppbarTrailingImageOne] widget.
  AppbarTrailingImageOne({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.onTap,
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

  /// The margin around the image.
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          onTap?.call();
        },
        child: CustomImageView(
          imagePath: imagePath,
          height: height ?? 32.h,
          width: width ?? 32.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
