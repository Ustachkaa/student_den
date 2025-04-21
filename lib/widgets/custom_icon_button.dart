import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A custom icon button widget with customizable properties.
class CustomIconButton extends StatelessWidget {
  /// Creates a [CustomIconButton] widget.
  const CustomIconButton({
    Key? key,
    this.alignment,
    this.width,
    this.height,
    this.decoration,
    this.padding,
    this.onTap,
    this.child,
  }) : super(key: key);

  /// The alignment of the icon button within its parent.
  final Alignment? alignment;

  /// The width of the icon button.
  final double? width;

  /// The height of the icon button.
  final double? height;

  /// The decoration of the icon button.
  final BoxDecoration? decoration;

  /// The padding around the icon button.
  final EdgeInsetsGeometry? padding;

  /// A callback function that is called when the icon button is tapped.
  final VoidCallback? onTap;

  /// The widget to display as the icon.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
        alignment: alignment ?? Alignment.center,
        child: iconButtonWidget)
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => Container(
    height: height ?? 0,
    width: width ?? 0,
    child: DecoratedBox(
      decoration: decoration ??
          BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(10.h),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.secondaryContainer.withOpacity(
                  0.25,
                ),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: const Offset(0, 2),
              )
            ],
          ),
      child: IconButton(
        padding: padding ?? EdgeInsets.zero,
        onPressed: onTap,
        icon: child ?? Container(),
      ),
    ),
  );
}
